## Suggested - User Guide
> 1) Replace the modified JSP files to the particular folder.
>   e.g. header_1.15.000.jsp => header.jsp; template_savie_online_1.15.000.jsp => template_savie_online.jsp
> 2) Run the pre-processor COMPASS
>   i.e. please follow below "SCSS Watch & running pre-processor".

## SCSS Build & using COMPASS
```
  <site/resources-path>$ compass create sass
```

## SCSS Watch & running pre-processor
```
  <site/resources-path>$ compass watch sass
```

## CSS -> SCSS
```
  <site/resources-path>$ sass-convert -F css -T sass <source_filename>.css <dest_filename>.scss
```

## CSS Revamp version released
> v0.1.0 ~ v0.1.3   : 6~16 May, 2016
>                   elementary stage for
>                   1) analysis and feasibility study for SCSS
>                   2) building the SCSS structure, and using the pre-processor, i.e. COMPASS.
>                   3) migrate the development from branch# 1.14.003 (fwdhk_dev) => branch# 1.15.000 (ROPHI_fwdhk)
>                   4) drafting the transitional main.css file for adding new code.
> v0.1.4            : 17 May, 2016
>                   Merge to the development server environment - branch# 1.15.000 (ROPHI_fwdhk)
> v0.1.5            : 19 May, 2016
>                   
>                   
