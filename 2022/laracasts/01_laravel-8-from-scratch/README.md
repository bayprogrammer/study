# Laravel 8 From Scratch

[Laracasts Video Course][1] by [Jeffrey Way][2]

[1]: https://laracasts.com/series/laravel-8-from-scratch
[2]: https://github.com/JeffreyWay

## Table of Contents

### [Section 1, Prerequisites and Setup](#section-1-prerequisites-and-setup-1)

* [X] [01 An Animated Introduction to MVC](#01-an-animated-introduction-to-mvc)
* [X] [02 Initial Environment Setup and Composer](#02-initial-environmental-setup-and-composer)
* [X] [03 The Laravel Installer Tool](#03-the-laravel-installer-tool)
* [X] [04 Why Do We Use Tools](#04-why-do-we-use-tools)

### [Section 2, The Basics](#section-2-The-basics-1)

* [ ] [05 How a Route Loads a View](#05-how-a-route-loads-a-view)
* [ ] [06 Include CSS and JavaScript](#06-include-css-and-javascript)
* [ ] [07 Make a Route and Link to it](#07-make-a-route-and-link-to-it)
* [ ] [08 Store Blog Posts as HTML Files](#08-store-blog-posts-as-html-files)
* [ ] [09 Route Wildcard Constraints](#09-route-wildcard-constraints)
* [ ] [10 Use Caching for Expensive Operations](#10-use-caching-for-expensive-operations)
* [ ] [11 Use the Filesystem Class to Read a Directory](#11-use-the-filesystem-class-to-read-a-directory)
* [ ] [12 Find a Composer Package for Post Metadata](#12-find-a-composer-package-for-post-metadata)
* [ ] [13 Collection Sorting and Caching Refresher](#13-collection-sorting-and-caching-refresher)

### [Section 3, Blade](#section-3-blade-1)

* [ ] [14 Blade: The Absolute Basics](#14-blade-the-absolute-basics)
* [ ] [15 Blade Layouts Two Ways](#15-blade-layouts-two-ways)
* [ ] [16 A Few Tweaks and Consideration](#16-a-few-tweaks-and-consideration)

### [Section 4, Working With Databases](#section-4-working-with-databases-1)

* [ ] [17 Environment Files and Database Connections](#17-environment-files-and-database-connections)
* [ ] [18 Migrations: The Absolute Basics](#18-migrations-the-absolute-basics)
* [ ] [19 Eloquent and the Active Record Pattern](#19-eloquent-and-the-active-record-pattern)
* [ ] [20 Make a Post Model and Migration](#20-make-a-post-model-and-migration)
* [ ] [21 Eloquent Updates and HTML Escaping](#21-eloquent-updates-and-html-escaping)
* [ ] [22 3 Ways to Mitigate Mass Assignment Vulnerabilities](#22-3-ways-to-mitigate-mass-assignment-vulnerabilities)
* [ ] [23 Route Model Binding](#23-route-model-binding)
* [ ] [24 Your First Eloquent Relationship](#24-your-first-eloquent-relationship)
* [ ] [25 Show All Posts Associated With a Category](#25-show-all-posts-associated-with-a-category)
* [ ] [26 Clockwork, and the N+1 Problem](#26-clockwork-and-the-n1-problem)
* [ ] [27 Database Seeding Saves Time](#27-database-seeding-saves-time)
* [ ] [28 Turbo Boost With Factories](#28-turbo-boost-with-factories)
* [ ] [29 View All Posts By An Author](#29-view-all-posts-by-an-author)
* [ ] [30 Eager Load Relationships on an Existing Model](#30-eager-load-relationships-on-an-existing-model)

### [Section 5, Integrate the Design](#section-5-integrate-the-design-1)

* [ ] [31 Convert the HTML and CSS to Blade](#31-convert-the-html-and-css-to-blade)
* [ ] [32 Blade Components and CSS Grids](#32-blade-components-and-css-grids)
* [ ] [33 Convert the Blog Post Page](#33-convert-the-blog-post-page)
* [ ] [34 A Small JavaScript Dropdown Detour](#34-a-small-javascript-dropdown-detour)
* [ ] [35 How to Extract a Dropdown Blade Component](#35-how-to-extract-a-dropdown-blade-component)
* [ ] [36 Quick Tweaks and Clean-Up](#36-quick-tweaks-and-clean-up)

### [Section 6, Search](#section-6-search-1)

* [ ] [37 Search (The Messy Way)](#37-search-the-messy-way)
* [ ] [38 Search (The Cleaner Way)](#38-search-the-cleaner-way)

### [Section 7, Filtering](#section-7-filtering-1)

* [ ] [39 Advanced Eloquent Query Constraints](#39-advanced-eloquent-query-constraints)
* [ ] [40 Extract a Category Dropdown Blade Component](#40-extract-a-category-dropdown-blade-component)
* [ ] [41 Author Filtering](#41-author-filtering)
* [ ] [42 Merge Category and Search Queries](#42-merge-category-and-search-queries)
* [ ] [43 Fix a Confusing Eloquent Query Bug](#43-fix-a-confusing-eloquent-query-bug)

### [Section 8, Pagination](#section-8-pagination-1)

* [ ] [44 Laughably Simple Pagination](#44-laughably-simple-pagination)

### [Section 9, Forms and Authentication](#section-9-forms-and-authentication-1)

* [ ] [45 Build a Register User Page](#45-build-a-register-user-page)
* [ ] [46 Automatic Password Hashing With Mutators](#46-automatic-password-hashing-with-mutators)
* [ ] [47 Failed Validation and Old Input Data](#47-failed-validation-and-old-input-data)
* [ ] [48 Show a Success Flash Message](#48-show-a-success-flash-message)
* [ ] [49 Login and Logout](#49-login-and-logout)
* [ ] [50 Build the Log In Page](#50-build-the-log-in-page)
* [ ] [51 Laravel Breeze Quick Peek](#51-laravel-breeze-quick-peek)

### [Section 10, Comments](#section-10-comments-1)

* [ ] [52 Write the Markup for a Post Comment](#52-write-the-markup-for-a-post-comment)
* [ ] [53 Table Consistency and Foreign Key Constraints](#53-table-consistency-and-foreign-key-constraints)
* [ ] [54 Make the Comments Section Dynamic](#54-make-the-comments-section-dynamic)
* [ ] [55 Design the Comment Form](#55-design-the-comment-form)
* [ ] [56 Activate the Comment Form](#56-activate-the-comment-form)
* [ ] [57 Some Light Chapter Clean Up](#57-some-light-chapter-clean-up)

### [Section 11, Newsletters and APIs](#section-11-newsletters-and-apis-1)

* [ ] [58 Mailchimp API Tinkering](#58-mailchimp-api-tinkering)
* [ ] [59 Make the Newsletter From Work](#59-make-the-newsletter-from-work)
* [ ] [60 Extract a Newsletter Service](#60-extract-a-newsletter-service)
* [ ] [61 Toy Chests and Contracts](#61-toy-chests-and-contracts)

### [Section 12, Admin Section](#section-12-admin-section-1)

* [ ] [62 Limit Access to Only Admins](#62-limit-access-to-only-admins)
* [ ] [63 Create the Publish Post Form](#63-create-the-publish-post-form)
* [ ] [64 Validate and Store Post Thumbnails](#64-validate-and-store-post-thumbnails)
* [ ] [65 Extract Form-Specific Blade Components](#65-extract-form-specific-blade-components)
* [ ] [66 Extend the Admin Layout](#66-extend-the-admin-layout)
* [ ] [67 Create a Form to Edit and Delete Posts](#67-create-a-form-to-edit-and-delete-posts)
* [ ] [68 Group and Store Validation Logic](#68-group-and-store-validation-logic)
* [ ] [69 All About Authorization](#69-all-about-authorization)

### [Section 13, Conclusion](#section-13-conclusion-1)

* [ ] [70 Goodbye and Next Steps](#70-goodbye-and-next-steps)

-----

## Section 1, Prerequisites and Setup

### 01 An Animated Introduction to MVC

### 02 Initial Environment Setup and Composer

```
$ composer create-project laravel/laravel blog
```

### 03 The Laravel Installer Tool

```
$ composer global require laravel/installer
$ laravel new
```

### 04 Why Do We Use Tools

## Section 2, The Basics

### 05 How a Route Loads a View

### 06 Include CSS and JavaScript

### 07 Make a Route and Link to it

### 08 Store Blog Posts as HTML Files

### 09 Route Wildcard Constraints

### 10 Use Caching for Expensive Operations

### 11 Use the Filesystem Class to Read a Directory

### 12 Find a Composer Package for Post Metadata

### 13 Collection Sorting and Caching Refresher

## Section 3, Blade

### 14 Blade: The Absolute Basics

### 15 Blade Layouts Two Ways

### 16 A Few Tweaks and Consideration

## Section 4, Working With Databases

### 17 Environment Files and Database Connections

### 18 Migrations: The Absolute Basics

### 19 Eloquent and the Active Record Pattern

### 20 Make a Post Model and Migration

### 21 Eloquent Updates and HTML Escaping

### 22 3 Ways to Mitigate Mass Assignment Vulnerabilities

### 23 Route Model Binding

### 24 Your First Eloquent Relationship

### 25 Show All Posts Associated With a Category

### 26 Clockwork, and the N+1 Problem

### 27 Database Seeding Saves Time

### 28 Turbo Boost With Factories

### 29 View All Posts By An Author

### 30 Eager Load Relationships on an Existing Model

## Section 5, Integrate the Design

### 31 Convert the HTML and CSS to Blade

### 32 Blade Components and CSS Grids

### 33 Convert the Blog Post Page

### 34 A Small JavaScript Dropdown Detour

### 35 How to Extract a Dropdown Blade Component

### 36 Quick Tweaks and Clean-Up

## Section 6, Search

### 37 Search (The Messy Way)

### 38 Search (The Cleaner Way)

## Section 7, Filtering

### 39 Advanced Eloquent Query Constraints

### 40 Extract a Category Dropdown Blade Component

### 41 Author Filtering

### 42 Merge Category and Search Queries

### 43 Fix a Confusing Eloquent Query Bug

## Section 8, Pagination

### 44 Laughably Simple Pagination

## Section 9, Forms and Authentication

### 45 Build a Register User Page

### 46 Automatic Password Hashing With Mutators

### 47 Failed Validation and Old Input Data

### 48 Show a Success Flash Message

### 49 Login and Logout

### 50 Build the Log In Page

### 51 Laravel Breeze Quick Peek

## Section 10, Comments

### 52 Write the Markup for a Post Comment

### 53 Table Consistency and Foreign Key Constraints

### 54 Make the Comments Section Dynamic

### 55 Design the Comment Form

### 56 Activate the Comment Form

### 57 Some Light Chapter Clean Up

## Section 11, Newsletters and APIs

### 58 Mailchimp API Tinkering

### 59 Make the Newsletter From Work

### 60 Extract a Newsletter Service

### 61 Toy Chests and Contracts

## Section 12, Admin Section

### 62 Limit Access to Only Admins

### 63 Create the Publish Post Form

### 64 Validate and Store Post Thumbnails

### 65 Extract Form-Specific Blade Components

### 66 Extend the Admin Layout

### 67 Create a Form to Edit and Delete Posts

### 68 Group and Store Validation Logic

### 69 All About Authorization

## Section 13, Conclusion

### 70 Goodbye and Next Steps

