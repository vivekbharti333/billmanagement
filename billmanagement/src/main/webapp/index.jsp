<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Arrays" %>
<%
    List<String> slides = Arrays.asList("#1abc9c", "#3498db", "#9b59b6", "#34495e", "#e74c3c");
    int totalSlides = slides.size();
%>

<!DOCTYPE html>
<html>
<head>
    <title>Simple Image Slider</title>
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Anton' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Neucha' rel='stylesheet' type='text/css'>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

    <style type="text/css">
        * { margin: 0; padding: 0; list-style: none; }
        a { text-decoration: none; color: #666; }
        a:hover { color: #1bc1a3; }
        body, hmtl { background: #ecf0f1; font-family: 'Anton', sans-serif; }

        #wrapper {
            width: 600px;
            margin: 50px auto;
            height: 400px;
            position: relative;
            color: #fff;
            text-shadow: rgba(0, 0, 0, 0.1) 2px 2px 0px;
        }

        #slider-wrap {
            width: 600px;
            height: 400px;
            position: relative;
            overflow: hidden;
        }

        #slider-wrap ul#slider {
            width: 100%;
            height: 100%;
            position: absolute;
            top: 0;
            left: 0;
        }

        #slider-wrap ul#slider li {
            float: left;
            position: relative;
            width: 600px;
            height: 400px;
        }

        #slider-wrap ul#slider li > div {
            position: absolute;
            top: 20px;
            left: 35px;
        }

        #slider-wrap ul#slider li > div h3 {
            font-size: 36px;
            text-transform: uppercase;
        }

        #slider-wrap ul#slider li > div span {
            font-family: Neucha, Arial, sans serif;
            font-size: 21px;
        }

        #slider-wrap ul#slider li i {
            text-align: center;
            line-height: 400px;
            display: block;
            width: 100%;
            font-size: 90px;
        }

        .btns {
            position: absolute;
            width: 50px;
            height: 60px;
            top: 50%;
            margin-top: -25px;
            line-height: 57px;
            text-align: center;
            cursor: pointer;
            background: rgba(0, 0, 0, 0.1);
            z-index: 100;
            -webkit-user-select: none;
            -moz-user-select: none;
            -khtml-user-select: none;
            -ms-user-select: none;
            -webkit-transition: all 0.1s ease;
            -moz-transition: all 0.1s ease;
            -o-transition: all 0.1s ease;
            -ms-transition: all 0.1s ease;
            transition: all 0.1s ease;
        }

        .btns:hover {
            background: rgba(0, 0, 0, 0.3);
        }

        #next {
            right: -50px;
            border-radius: 7px 0px 0px 7px;
        }

        #previous {
            left: -50px;
            border-radius: 0px 7px 7px 7px;
        }

        #counter {
            top: 30px;
            right: 35px;
            width: auto;
            position: absolute;
        }

        #slider-wrap.active #next {
            right: 0px;
        }

        #slider-wrap.active #previous {
            left: 0px;
        }

        #pagination-wrap {
            min-width: 20px;
            margin-top: 350px;
            margin-left: auto;
            margin-right: auto;
            height: 15px;
            position: relative;
            text-align: center;
        }

        #pagination-wrap ul {
            width: 100%;
        }

        #pagination-wrap ul li {
            margin: 0 4px;
            display: inline-block;
            width: 5px;
            height: 5px;
            border-radius: 50%;
            background: #fff;
            opacity: 0.5;
            position: relative;
            top: 0;
        }

        #pagination-wrap ul li.active {
            width: 12px;
            height: 12px;
            top: 3px;
            opacity: 1;
            box-shadow: rgba(0, 0, 0, 0.1) 1px 1px 0px;
        }

       

        #slider-wrap ul, #pagination-wrap ul li {
            -webkit-transition: all 0.3s cubic-bezier(1, .01, .32, 1);
            -moz-transition: all 0.3s cubic-bezier(1, .01, .32, 1);
            -o-transition: all 0.3s cubic-bezier(1, .01, .32, 1);
            -ms-transition: all 0.3s cubic-bezier(1, .01, .32, 1);
            transition: all 0.3s cubic-bezier(1, .01, .32, 1);
        }
    </style>
</head>
<body>



<div id="wrapper">

    <div id="slider-wrap">
        <ul id="slider">
            <% for (String color : slides) { %>
                <li data-color="<%= color %>">
                </li>
            <% } %>
        </ul>

        <!-- Controls -->
        <div class="btns" id="next"><i class="fa fa-arrow-right"></i></div>
        <div class="btns" id="previous"><i class="fa fa-arrow-left"></i></div>
        <div id="counter"></div>

        <div id="pagination-wrap">
            <ul></ul>
        </div>
        <!-- Controls -->

    </div>

</div>

<script>
    // current position
    var pos = 0;
    // number of slides
    var totalSlides = <%= totalSlides %>;
    // get the slide width
    var sliderWidth = $('#slider-wrap').width();

    $(document).ready(function () {
        /*****************
         BUILD THE SLIDER
         *****************/
        // set width to be 'x' times the number of slides
        $('#slider-wrap ul#slider').width(sliderWidth * totalSlides);

        // next slide
        $('#next').click(function () {
            slideRight();
        });

        // previous slide
        $('#previous').click(function () {
            slideLeft();
        });

        /*************************
         //*> OPTIONAL SETTINGS
         ************************/
        // automatic slider
        var autoSlider = setInterval(slideRight, 3000);

        // for each slide
        $.each($('#slider-wrap ul li'), function () {
            // set its color
            var c = $(this).attr("data-color");
            $(this).css("background", c);

            // create a pagination
            var li = document.createElement('li');
            $('#pagination-wrap ul').append(li);
        });

        // counter
        countSlides();

        // pagination
        pagination();

        // hide/show controls/btns when hover
        // pause automatic slide when hover
        $('#slider-wrap').hover(
            function () {
                $(this).addClass('active');
                clearInterval(autoSlider);
            },
            function () {
                $(this).removeClass('active');
                autoSlider = setInterval(slideRight, 3000);
            }
        );
    });// DOCUMENT READY

    /***********
     SLIDE LEFT
     ************/
    function slideLeft() {
        pos--;
        if (pos == -1) {
            pos = totalSlides - 1;
        }
        $('#slider-wrap ul#slider').css('left', -(sliderWidth * pos));

        //*> optional
        countSlides();
        pagination();
    }

    /************
     SLIDE RIGHT
     *************/
    function slideRight() {
        pos++;
        if (pos == totalSlides) {
            pos = 0;
        }
        $('#slider-wrap ul#slider').css('left', -(sliderWidth * pos));

        //*> optional
        countSlides();
        pagination();
    }

    /************************
     //*> OPTIONAL SETTINGS
     ************************/
    function countSlides() {
        $('#counter').html(pos + 1 + ' / ' + totalSlides);
    }

    function pagination() {
        $('#pagination-wrap ul li').removeClass('active');
        $('#pagination-wrap ul li:eq(' + pos + ')').addClass('active');
    }
</script>

</body>
</html>
