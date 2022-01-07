<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
    <title>Zoom WebSDK</title>
    <meta charset="utf-8" />

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<fmt:requestEncoding value="utf-8"/>
    <meta charset="utf-8" />
    <link type="text/css" rel="stylesheet" href="https://source.zoom.us/2.1.1/css/bootstrap.css" />
    <link type="text/css" rel="stylesheet" href="https://source.zoom.us/2.1.1/css/react-select.css" />
    <meta name="format-detection" content="telephone=no">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

	<script src="http://code.jquery.com/jquery-latest.min.js"></script>

    <style>
        .sdk-select {
            height: 34px;
            border-radius: 4px;
        }

        .websdktest button {
            float: right;
            margin-left: 5px;
        }

        #nav-tool {
            margin-bottom: 0px;
        }

        #show-test-tool {
            position: absolute;
            top: 100px;
            left: 0;
            display: block;
            z-index: 99999;
        }

        #display_name {
            width: 250px;
        }


        #websdk-iframe {
            width: 700px;
            height: 500px;
            border: 1px;
            border-color: red;
            border-style: dashed;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            left: 50%;
            margin: 0;
        }
    </style>
</head>
<body>

    <nav id="nav-tool" class="navbar navbar-inverse navbar-fixed-top">
		<form
			name="zoomConnectFrm" 
			action="${pageContext.request.contextPath}/untactInterview/zoomMeetingConnect.do" 
			method="get">
			<input type="text" name="joinUrl">
    	</form>
        <div class="container">
            <div class="navbar-header">
                <a class="navbar-brand" href="#">Zoom WebSDK</a>
            </div>
            <div id="navbar" class="websdktest">
                <form class="navbar-form navbar-right" id="meeting_form">
                    <div class="form-group">
                        <input type="text" name="display_name" id="display_name" value="2.1.1#CDN" maxLength="100"
                            placeholder="Name" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <input type="text" name="meeting_number" id="meeting_number" value="" maxLength="200"
                            style="width:150px" placeholder="Meeting Number" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <input type="text" name="meeting_pwd" id="meeting_pwd" value="" style="width:150px"
                            maxLength="32" placeholder="Meeting Password" class="form-control">
                    </div>
                    <div class="form-group">
                        <input type="text" name="meeting_email" id="meeting_email" value="" style="width:150px"
                            maxLength="32" placeholder="Email option" class="form-control">
                    </div>

                    <div class="form-group">
                        <select id="meeting_role" class="sdk-select">
                            <option value=0>Attendee</option>
                            <option value=1>Host</option>
                            <option value=5>Assistant</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <select id="meeting_china" class="sdk-select">
                            <option value=0>Global</option>
                            <option value=1>China</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <select id="meeting_lang" class="sdk-select">
                            <option value="en-US">English</option>
                            <option value="de-DE">German Deutsch</option>
                            <option value="es-ES">Spanish EspaÃ±ol</option>
                            <option value="fr-FR">French FranÃ§ais</option>
                            <option value="jp-JP">Japanese æ¥æ¬èª</option>
                            <option value="pt-PT">Portuguese Portuguese</option>
                            <option value="ru-RU">Russian Ð ÑÑÑÐºÐ¸Ð¹</option>
                            <option value="zh-CN">Chinese ç®ä½ä¸­æ</option>
                            <option value="zh-TW">Chinese ç¹ä½ä¸­æ</option>
                            <option value="ko-KO">Korean íêµ­ì´</option>
                            <option value="vi-VN">Vietnamese Tiáº¿ng Viá»t</option>
                            <option value="it-IT">Italian italiano</option>
                        </select>
                    </div>

                    <input type="hidden" value="" id="copy_link_value" />
                    <button type="submit" class="btn btn-primary" id="join_meeting">Join</button>
                    <button type="submit" class="btn btn-primary" id="clear_all">Clear</button>
                    <button type="button" link="" onclick="window.copyJoinLink('#copy_join_link')"
                        class="btn btn-primary" id="copy_join_link">Copy Direct join link</button>


                </form>
            </div>
            <!--/.navbar-collapse -->
        </div>
    </nav>


    <div id="show-test-tool">
        <button type="submit" class="btn btn-primary" id="show-test-tool-btn"
            title="show or hide top test tool">Show</button>
    </div>
     <script>
        document.getElementById('show-test-tool-btn').addEventListener("click", function (e) {
            var textContent = e.target.textContent;
            if (textContent === 'Show') {
                document.getElementById('nav-tool').style.display = 'block';
                document.getElementById('show-test-tool-btn').textContent = 'Hide';
            } else {
                document.getElementById('nav-tool').style.display = 'none';
                document.getElementById('show-test-tool-btn').textContent = 'Show';
            }
        })
    </script> 

    <script src="https://source.zoom.us/2.1.1/lib/vendor/react.min.js"></script>
    <script src="https://source.zoom.us/2.1.1/lib/vendor/react-dom.min.js"></script>
    <script src="https://source.zoom.us/2.1.1/lib/vendor/redux.min.js"></script>
    <script src="https://source.zoom.us/2.1.1/lib/vendor/redux-thunk.min.js"></script>
    <script src="https://source.zoom.us/2.1.1/lib/vendor/lodash.min.js"></script>
    <script src="https://source.zoom.us/zoom-meeting-2.1.1.min.js"></script>
    
    <script src="${pageContext.request.contextPath }/resources/js/untact_interview_statistics_practice/untact_interview/tool.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/untact_interview_statistics_practice/untact_interview/vconsole.min.js"></script>


    <script>
    	window.addEventListener('DOMContentLoaded', function(event) {
    	  console.log('DOM fully loaded and parsed');
    	  websdkready();
    	});


    	function websdkready() {
    	  var testTool = window.testTool;
    	  if (testTool.isMobileDevice()) {
    	    vConsole = new VConsole();
    	  }
    	  console.log("checkSystemRequirements");
    	  console.log(JSON.stringify(ZoomMtg.checkSystemRequirements()));

    	  // it's option if you want to change the WebSDK dependency link resources. setZoomJSLib must be run at first
    	  // if (!china) ZoomMtg.setZoomJSLib('https://source.zoom.us/2.1.1/lib', '/av'); // CDN version default
    	  // else ZoomMtg.setZoomJSLib('https://jssdk.zoomus.cn/2.1.1/lib', '/av'); // china cdn option
    	  // ZoomMtg.setZoomJSLib('http://localhost:9999/node_modules/@zoomus/websdk/dist/lib', '/av'); // Local version default, Angular Project change to use cdn version
    	  ZoomMtg.preLoadWasm(); // pre download wasm file to save time.

    	  var API_KEY = "FeyWs7fdRDe8JYUCrSEldw";
    	  /**
    	   * NEVER PUT YOUR ACTUAL API SECRET IN CLIENT SIDE CODE, THIS IS JUST FOR QUICK PROTOTYPING
    	   * The below generateSignature should be done server side as not to expose your api secret in public
    	   * You can find an eaxmple in here: https://marketplace.zoom.us/docs/sdk/native-sdks/web/essential/signature
    	   */
    	  var API_SECRET = "gNWS2i0PD8P9uyFcR4bIDP0yW8hktyGDLjtl";

    	  // some help code, remember mn, pwd, lang to cookie, and autofill.
    	  document.getElementById("display_name").value =
    	    "CDN" +
    	    ZoomMtg.getJSSDKVersion()[0] +
    	    testTool.detectOS() +
    	    "#" +
    	    testTool.getBrowserInfo();
    	  document.getElementById("meeting_number").value = testTool.getCookie(
    	    "meeting_number"
    	  );
    	  document.getElementById("meeting_pwd").value = testTool.getCookie(
    	    "meeting_pwd"
    	  );
    	  if (testTool.getCookie("meeting_lang"))
    	    document.getElementById("meeting_lang").value = testTool.getCookie(
    	      "meeting_lang"
    	    );

    	  document
    	    .getElementById("meeting_lang")
    	    .addEventListener("change", function (e) {
    	      testTool.setCookie(
    	        "meeting_lang",
    	        document.getElementById("meeting_lang").value
    	      );
    	      testTool.setCookie(
    	        "_zm_lang",
    	        document.getElementById("meeting_lang").value
    	      );
    	    });
    	  // copy zoom invite link to mn, autofill mn and pwd.
    	  document
    	    .getElementById("meeting_number")
    	    .addEventListener("input", function (e) {
    	      var tmpMn = e.target.value.replace(/([^0-9])+/i, "");
    	      if (tmpMn.match(/([0-9]{9,11})/)) {
    	        tmpMn = tmpMn.match(/([0-9]{9,11})/)[1];
    	      }
    	      var tmpPwd = e.target.value.match(/pwd=([\d,\w]+)/);
    	      if (tmpPwd) {
    	        document.getElementById("meeting_pwd").value = tmpPwd[1];
    	        testTool.setCookie("meeting_pwd", tmpPwd[1]);
    	      }
    	      document.getElementById("meeting_number").value = tmpMn;
    	      testTool.setCookie(
    	        "meeting_number",
    	        document.getElementById("meeting_number").value
    	      );
    	    });

    	  document.getElementById("clear_all").addEventListener("click", function (e) {
    	    testTool.deleteAllCookies();
    	    document.getElementById("display_name").value = "";
    	    document.getElementById("meeting_number").value = "";
    	    document.getElementById("meeting_pwd").value = "";
    	    document.getElementById("meeting_lang").value = "en-US";
    	    document.getElementById("meeting_role").value = 0;
    	    window.location.href = "/index.jsp";
    	  });

    	  // click join meeting button
    	  document
    	    .getElementById("join_meeting")
    	    .addEventListener("click", function (e) {
    	      e.preventDefault();
    	      var meetingConfig = testTool.getMeetingConfig();
    	      if (!meetingConfig.mn || !meetingConfig.name) {
    	        alert("Meeting number or username is empty");
    	        return false;
    	      }

    	      
    	      testTool.setCookie("meeting_number", meetingConfig.mn);
    	      testTool.setCookie("meeting_pwd", meetingConfig.pwd);

    	      var signature = ZoomMtg.generateSignature({
    	        meetingNumber: meetingConfig.mn,
    	        apiKey: API_KEY,
    	        apiSecret: API_SECRET,
    	        role: meetingConfig.role,
    	        success: function (res) {
    	          console.log(res.result);
    	          meetingConfig.signature = res.result;
    	          meetingConfig.apiKey = API_KEY;
    	          var joinUrl = testTool.serialize(meetingConfig);
    	          console.log("joinUrl = " + joinUrl);
    	          $("input[name=joinUrl]").val(joinUrl);
    	          $("[name=zoomConnectFrm]").submit();
    	        },
    	      });
    	    });

    	  function copyToClipboard(elementId) {
    	    var aux = document.createElement("input");
    	    aux.setAttribute("value", document.getElementById(elementId).getAttribute('link'));
    	    document.body.appendChild(aux);  
    	    aux.select();
    	    document.execCommand("copy");
    	    document.body.removeChild(aux);
    	  }

    	}


    </script>
</body>

</html>