<%@ Page Language="C#" AutoEventWireup="true" CodeFile="sliderbar01.aspx.cs" Inherits="sliderbar01" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>jQuery Bar Rating - Minimal, light-weight jQuery ratings</title>
    <meta name="description" content="" />
    <meta name="viewport" content="width=1024" />

    <link rel="stylesheet" href="sliderbar01style/normalize.min.css" />
    <link rel="stylesheet" href="sliderbar01style/main.css" />
    <link rel="stylesheet" href="sliderbar01style/examples.css" />

    <link href="http://fonts.googleapis.com/css?family=Lato:300,400,600" rel="stylesheet" type="text/css" />
    <link href="http://fonts.googleapis.com/css?family=Source+Code+Pro" rel="stylesheet" type="text/css" />

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="sliderbar01style/jquery-1.11.2.min.js"><\/script>')</script>

    <script src="sliderbar01style/jquery.barrating.js"></script>
    <script src="sliderbar01style/examples.js"></script>



    <!--[if lt IE 9]>
			<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
			<script>window.html5 || document.write('<script src="sliderbar01style/html5shiv.js"><\/script>')</script>
		<![endif]-->
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <section class="section section-intro">
                <div class="bars"></div>

                <h1>jQuery Bar Rating</h1>

                <p class="tagline">Minimal, light-weight jQuery ratings.</p>

                <p>
                    jQuery Bar Rating Plugin works by transforming a standard
				select field into a rating widget. The rating widget can be
				flexibly styled with CSS. Take a look at a few examples.
		
                </p>
            </section>

            <section class="section section-examples">

<%--                <div class="controls">
                    <a href="#" class="deactivated rating-enable">enable</a>
                    <a href="#" class="rating-disable">disable</a>
                </div>--%>

                <div class="examples">

                    <div class="row">
                        <div class="col">

                            <div class="box box-orange">
                                <div class="box-header">Example A</div>
                                <div class="box-body">
                                    <select id="example-a" name="rating">
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                                        <option value="5">5</option>
                                        <option value="6">6</option>
                                        <option value="7" selected="selected">7</option>
                                        <option value="8">8</option>
                                        <option value="9">9</option>
                                        <option value="10">10</option>
                                    </select>
                                </div>
                            </div>

                        </div>
                        <div class="col">

                            <div class="box box-green">
                                <div class="box-header">Example B</div>
                                <div class="box-body">
                                    <select id="example-b" name="rating">
                                        <option value="Bad">Bad</option>
                                        <option value="Mediocre">Mediocre</option>
                                        <option value="Good" selected="selected">Good</option>
                                        <option value="Awesome">Awesome</option>
                                    </select>
                                </div>
                            </div>

                        </div>
                    </div>

                    <div class="row">
                        <div class="col">

                            <div class="box box-blue">
                                <div class="box-header">Example C</div>
                                <div class="box-body">
                                    <select id="example-c" name="rating">
                                        <option value=""></option>
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                                        <option value="5">5</option>
                                    </select>
                                </div>
                            </div>

                        </div>
                        <div class="col">

                            <div class="box box-orange">
                                <div class="box-header">Example D</div>
                                <div class="box-body">
                                    <select id="example-d" name="rating">
                                        <option value="1" data-html="<strong>1</strong>">1</option>
                                        <option value="2" data-html="<strong>2</strong>">2</option>
                                        <option value="3" data-html="<strong>3</strong>">3</option>
                                        <option value="4" data-html="<strong>4</strong>">4</option>
                                        <option value="5" data-html="<strong>5</strong>">5</option>
                                        <option value="6" data-html="<strong>6</strong>">6</option>
                                        <option value="7" data-html="<strong>7</strong>">7</option>
                                        <option value="8" data-html="<strong>8</strong>">8</option>
                                    </select>
                                </div>
                            </div>

                        </div>
                    </div>

                    <div class="row">
                        <div class="col">

                            <div class="box box-green">
                                <div class="box-header">Example E</div>
                                <div class="box-body">
                                    <select id="example-e" name="rating">
                                        <option value="A">A</option>
                                        <option value="B">B</option>
                                        <option value="C">C</option>
                                        <option value="D">D</option>
                                        <option value="E">E</option>
                                        <option value="F">F</option>
                                    </select>
                                </div>
                            </div>

                        </div>
                        <div class="col">

                            <div class="box box-blue">
                                <div class="box-header">Example F</div>
                                <div class="box-body">
                                    <select id="example-f" name="rating">
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                                        <option value="5">5</option>
                                    </select>
                                </div>
                            </div>

                        </div>
                    </div>

                    <div class="row">
                        <div class="col">

                            <div class="box box-orange box-large">
                                <div class="box-header">Example G</div>
                                <div class="box-body">
                                    <select id="example-g" name="rating">
                                        <option value="Strongly Agree">Strongly Agree</option>
                                        <option value="Agree">Agree</option>
                                        <option value="Neither Agree or Disagree" selected="selected">Neither Agree or Disagree</option>
                                        <option value="Disagree">Disagree</option>
                                        <option value="Strongly Disagree">Strongly Disagree</option>
                                    </select>
                                </div>
                            </div>

                        </div>
                        <div class="col">

                            <div class="box box-green box-large">
                                <div class="box-header">Example H</div>
                                <div class="box-body">
                                    <select id="example-h" name="rating">
                                        <option value="10">10</option>
                                        <option value="9">9</option>
                                        <option value="8">8</option>
                                        <option value="7">7</option>
                                        <option value="6">6</option>
                                        <option value="5">5</option>
                                        <option value="4">4</option>
                                        <option value="3">3</option>
                                        <option value="2">2</option>
                                        <option value="1" selected="selected">1</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </form>
</body>
</html>
