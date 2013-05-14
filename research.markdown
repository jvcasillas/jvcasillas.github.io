---
layout: default
title: Research
analytics : true
---

### Research


<div class="tabbable">
    <ul class="nav nav-tabs" id="myTab">
        <li class="active">
            <a href="#current-research" data-toggle="tab">Current research</a>
        </li>
        <li class="">
            <a href="#publications" data-toggle="tab">Publications</a>
        </li>
        <li class="">
            <a href="#presentations" data-toggle="tab">Presentations</a>
        </li>
        <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Filters <b class="caret"></b></a>
                <ul class="dropdown-menu">
                    <li><a href="#">Filter1</a></li>
                    <li><a href="#">Filter2</a></li>
                </ul>
        </li>
    </ul>
    <div class="tab-content">
        <div class="tab-pane active" id="current-research">
            <p>I am an active member of the <a alt="AAPL" href="https://sites.google.com/site/miquelsimonet/sports-lab-az" target='_new'><span class="showtooltip" title="AAPL webpage">Arizona Applied Phonetics Laboratory</span></a> at the University of Arizona. My main interests are in phonetics and syntax. My current projects are centered on second language speech learning &amp; bilingualism. Specifically, I investigate native phonetic experience and its influence on L2 speech production, perception and lexical processing. I am also interested in how dilectal variation affects linguistic attitudes.</p>
        </div>
        <div class="tab-pane" id="publications">
            <p>Howdy, I'm in Section 2.</p>
        </div>
        <div class="tab-pane" id="presentations">
            <p>Howdy, I'm in Section 3.</p>
        </div>
    </div>
</div>

<!-- Custom CSS -->
<link rel="stylesheet" href="/bootstrap/css/bootstrap.min2.css">

<!-- Jquery -->
<script type="text/javascript" src="/bootstrap/js/jquery-1.7.1.js"></script>

<!-- Javascript -->
<script type="text/javascript" src="/bootstrap/js/bootstrap.min.js"></script>


<script type="text/javascript">
$(function(){ 
    $("#myTab a:last").on('click', function (e) {
        e.preventDefault();
        $(this).tab('show');
    });  
});
</script>
