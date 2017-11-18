+++
# Date this page was created.
date = "2016-04-27"

# Project title.
title = "LaTeX IPA"

# Project summary to display on homepage.
summary = "A collection of snippets for SublimeText that simplify the process of using IPA in LaTeX."

# Optional image to display on homepage (relative to `static/img/` folder).
image_preview = "thumbnails/vowel_space.png"

# Tags: can be used for filtering projects.
# Example: `tags = ["machine-learning", "deep-learning"]`
tags = ["latex", "ipa", "sublimetext", "linguistics"]

# Optional external URL for project (replaces project detail page).
external_link = ""

# Does the project detail page use math formatting?
math = true

# Optional featured image (relative to `static/img/` folder).
[header]
image = "thumbnails/vowel_space.png"
caption = ":smile:"

+++

<iframe src="http://ghbtns.com/github-btn.html?user=jvcasillas&repo=LaTeX-IPA&type=watch&count=true&size=large" height="30" width="170" frameborder="0" scrolling="0" style="width:130px; height: 30px;" allowTransparency="true"></iframe>
<iframe src="http://ghbtns.com/github-btn.html?user=jvcasillas&repo=LaTeX-IPA&type=fork&count=true&size=large" height="30" width="170" frameborder="0" scrolling="0" style="width:130px; height: 30px;" allowTransparency="true"></iframe>
<iframe src="http://ghbtns.com/github-btn.html?user=jvcasillas&type=follow&count=true&size=large" height="30" width="240" frameborder="0" scrolling="0" style="width:240px; height: 30px;" allowTransparency="true"></iframe>

<p></p>

I made this repository to simplify the process of using IPA in $\LaTeX$. It is merely a collection of snippets for the package [TIPA][TIPA]. To install LaTeX-IPA see the [package control][package control LaTeX-IPA] page.


### File naming  

Consonants are labeled in the following way:  

- voicing -> point of articulation -> mode of articulation  
Ex. voiceless-bilabial-aprox.sublime-snippet = [&beta;]


Vowels are labeled in the following way:  

- vowel -> tense/lax -> height -> frontedness -> rounding  
Ex. vowel-tense-high-front-unrounded.sublime-snippet = [i]


### Tab triggers

There are 6 main groups:  

- **Diacritics**: type "diac" + tab  
- **Vowels**: type "vowel" + tab  

Consonants are divided into four subcategories:  

- **Fricatives** type "fric" + tab  
- **Affricates** type "affr" + tab  
- **Liquids**: type "liquid" + tab  
- **Nasals**: type "nasal" + tab

### Notes  

As of now (10/19/2013), I have only included the symbols that I use the most in English and Spanish. I will continue adding to the repository over time. It should be noted that the consonants do not include all categories (i.e. stops). This is because they are not represented by unsual symbols in IPA. 

[project page]: http://www.jvcasillas.com/LaTeX-IPA


[TIPA]: http://www.ctan.org/pkg/tipa
[package control LaTeX-IPA]: https://sublime.wbond.net/packages/LaTeX-IPA

