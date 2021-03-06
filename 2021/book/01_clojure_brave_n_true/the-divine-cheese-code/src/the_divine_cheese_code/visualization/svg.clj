(ns the-divine-cheese-code.visualization.svg
  (:require [clojure.string :as s])
  (:refer-clojure :exclude [min max]))

(defn comparator-over-maps [comparison-fn ks]
  (fn [maps]
    (zipmap ks
            (map (fn [k] (apply comparison-fn (map k maps)))
                 ks))))

(def min (comparator-over-maps clojure.core/min [:lat :lng]))
(def max (comparator-over-maps clojure.core/max [:lat :lng]))

;; (min [{:lat 1 :lng 3} {:lat 5 :lng 0}])  ;=> {:lat 1 :lng 0}
;; (max [{:lat 1 :lng 3} {:lat 5 :lng 0}])  ;=> {:lat 5 :lng 3}

(defn translate-to-00 [locations]
  (let [mincoords (min locations)]
    (map #(merge-with - % mincoords) locations)))

(defn scale [width height locations]
  (let [maxcoords (max locations)
        ratio {:lat (/ height (:lat maxcoords))
               :lng (/ width (:lng maxcoords))}]
    (map #(merge-with * % ratio) locations)))

(defn latlng->point
  "Convert lat/lng map to comma-separated string"
  [latlng]
  (str (:lng latlng) "," (:lat latlng)))

(defn points
  "Given a seq of lat/lng maps, return string of points joined by space"
  [locations]
  (clojure.string/join " " (map latlng->point locations)))

(defn line [points]
  (str "<polyline points=\"" points "\" />"))

(defn transform
  "Just chains other functions"
  [width height locations]
  (->> locations
       translate-to-00
       (scale width height)))

(defn xml
  "svg 'template', whicih also flips the coordinate system"
  [width height locations]
  (str "<svg height=\"" height "\" width=\"" width "\">"
    ;; These to <g> tags flip the coordinate system
    "<g transform=\"translate(0," height ")\">"
    "<g transform=\"scale(1,-1)\">"
    (-> (transform width height locations)
        points
        line)
    "</g></g>"
    "</svg>"))
