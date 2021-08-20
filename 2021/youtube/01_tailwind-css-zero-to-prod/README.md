# Tailwind CSS: From Zero to Production

[YouTube Video Course][1] by [Tailwind Labs][2]

[1]: https://www.youtube.com/playlist?list=PL5f_mz_zU5eXWYDXHUDOLBE0scnuJofO0
[2]: https://www.youtube.com/c/TailwindLabs

## Table of Contents

* [X] [00: Course Intro](#01-course-intro)
* [X] [01: Setting Up Tailwind CSS](#02-setting-up-tailwind-css)
* [ ] [02: The Utility First Workflow](#03-the-utility-first-workflow)
* [ ] [03: Responsive Design](#04-responsive-design)
* [ ] [04: Hover, Focus and Other States](#05-hover-focus-and-other-states)
* [ ] [05: Composing Utilities with @apply](#06-composing-utilities-with-apply)
* [ ] [06: Extracting Reusable Components](#07-extracting-reusable-components)
* [ ] [07: Customizing Your Design System](#08-customizing-your-design-system)
* [ ] [08: Optimizing for Production](#09-optimizing-for-production)

-----

## 00: Course Intro

## 01: Setting Up Tailwind CSS

e.g. `@tailwind base` - Tailwind relies on custom directives implemented via
[PostCSS](https://postcss.org/). We call these the Tailwind "layers" (`base`,
`components`, `utilities`).

```
$ cd up-and-running
$ asdf install nodejs 16.7.0
$ asdf local nodejs 16.7.0
$ asdf reshim ; hash -r
$ npm init -y
$ npm install -D tailwindcss@latest autoprefixer@latest postcss@latest
$ npx tailwind -i ./css/tailwind.css -o ./build/tailwind.css
$ npm install -D vite@latest
$ npx tailwind init -p
```

`tailwind.config.js` is the file we'll use to customize Tailwind CSS. We can
control PostCSS via the `postcss.config.js`.

With vive and PostCSS set up we can replace the original CDN link with
`/css/tailwind.css` directly, and no longer need the build/ directory:

```
$ rm -r build/
$ npm run dev
```

## 02: The Utility-First Workflow

## 03: Responsive Design

## 04: Hover, Focus and Other States

## 05: Composing Utilities with @apply

## 06: Extracting Reusable Components

## 07: Customizing Your Design System

## 08: Optimizing for Production
