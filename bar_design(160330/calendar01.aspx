<%@ Page Language="C#" AutoEventWireup="true" CodeFile="calendar01.aspx.cs" Inherits="calendar01" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <%-------------fullcalendar-------------%>

    <link href="calendar01style/fullcalendar.css" rel="stylesheet" />
    <link href="calendar01style/fullcalendar.print.css" rel="stylesheet" media='print' /><%--addmediaprint--%>
    <script src="calendar01style/moment.min.js"></script>
    <script src="calendar01style/jquery.min.js"></script>
    <script src="calendar01style/fullcalendar.min.js"></script>
    <style>
        body {
            margin: 40px 10px;
            padding: 0;
            font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
            font-size: 14px;
        }

        #calendar {
            max-width: 900px;
            margin: 0 auto;
        }
    </style>
    <script>

	$(document).ready(function() {
		
    $('#calendar').fullCalendar({
        header: {
            left: 'prev,next today',
            center: 'title',
            right: 'month,agendaWeek,agendaDay'
        },
        defaultDate: '2015-02-12',
        editable: true,
        eventLimit: true, // allow "more" link when too many events
        events: [
            {
                title: 'All Day Event',
                start: '2015-02-01'
            },
            {
                title: 'Long Event',
                start: '2015-02-07',
                end: '2015-02-10'
            },
            {
                id: 999,
                title: 'Repeating Event',
                start: '2015-02-09T16:00:00'
            },
            {
                id: 999,
                title: 'Repeating Event',
                start: '2015-02-16T16:00:00'
            },
            {
                title: 'Conference',
                start: '2015-02-11',
                end: '2015-02-13'
            },
            {
                title: 'Meeting',
                start: '2015-02-12T10:30:00',
                end: '2015-02-12T12:30:00'
            },
            {
                title: 'Lunch',
                start: '2015-02-12T12:00:00'
            },
            {
                title: 'Meeting',
                start: '2015-02-12T14:30:00'
            },
            {
                title: 'Happy Hour',
                start: '2015-02-12T17:30:00'
            },
            {
                title: 'Dinner',
                start: '2015-02-12T20:00:00'
            },
            {
                title: 'Birthday Party',
                start: '2015-02-13T07:00:00'
            },
            {
                title: 'Click for Google',
                url: 'http://google.com/',
                start: '2015-02-28'
            }
        ]
    });
		
});

             </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div id='calendar'></div>
        </div>
    </form>
</body>
</html>