# Tailwind CSS: From Zero to Production

[YouTube Video Course][1] by [Tailwind Labs][2]

[1]: https://www.youtube.com/playlist?list=PL5f_mz_zU5eXWYDXHUDOLBE0scnuJofO0
[2]: https://www.youtube.com/c/TailwindLabs

## Table of Contents

* [X] [00: Course Intro](#00-course-intro)
* [X] [01: Setting Up Tailwind CSS](#01-setting-up-tailwind-css)
* [X] [02: The Utility First Workflow](#02-the-utility-first-workflow)
* [X] [03: Responsive Design](#03-responsive-design)
* [X] [04: Hover, Focus and Other States](#04-hover-focus-and-other-states)
* [X] [05: Composing Utilities with @apply](#05-composing-utilities-with-apply)
* [X] [06: Extracting Reusable Components](#06-extracting-reusable-components)
* [X] [07: Customizing Your Design System](#07-customizing-your-design-system)
* [ ] [08: Optimizing for Production](#08-optimizing-for-production)

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

Default breakpoints:

* sm: 640px
* md: 768px
* lg: 1024px
* xl: 1280px
* 2xl: 1536px

## 04: Hover, Focus and Other States

## 05: Composing Utilities with @apply

## 06: Extracting Reusable Components

## 07: Customizing Your Design System

```
$ npx tailwind init tailwind-full.config.js --full
```

## 08: Optimizing for Production
