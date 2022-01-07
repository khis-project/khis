<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
    <title>Zoom WebSDK</title>
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
	
    <title>Zoom WebSDK</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta http-equiv="origin-trial" content="AmUgE16spGwQsV2mhJR4yjTL7uqOWtslZ+BMB3wMnjjskKkX6OtIABktImcFgceNH7r4qVNBv25Eqia8SbSENwMAAABheyJvcmlnaW4iOiJodHRwczovL2xvY2FsaG9zdDo5MDkwIiwiZmVhdHVyZSI6IlVucmVzdHJpY3RlZFNoYXJlZEFycmF5QnVmZmVyIiwiZXhwaXJ5IjoxNjU4ODc5OTk5fQ==">
</head>
<body>
	<input type="hidden" name="signature" style="display:none;"/>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
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
    	  // get meeting args from url
    	    var tmpArgs = testTool.parseQuery();
    	  
    	  //해당 부분은 연결되고 나서 직접 만들어서 zoom 연결 시 보내기
  	      var signature = ZoomMtg.generateSignature({
  	        meetingNumber: "${ZoomUrl['mn']}",
  	        apiKey: "${ZoomUrl['apiKey']}",
  	        apiSecret: "${ZoomUrl['apiSec']}",
  	        role: "${ZoomUrl['role']}",
  	        success: function (res) {
  	        	$("[name=signature]").val(res.result);
  	          console.log(res.result);
  	        },
  	      });
  	      
  	      
  	      
  	      
    	  //  console.log("tmpArgs");
    	  // console.log(tmpArgs);
    	  console.log("versino : ");
    	  console.log(tmpArgs.version);
    	  console.log("${ZoomUrl['name']}");
    	  
    	  var meetingConfig = {
    	    apiKey: "${ZoomUrl['apiKey']}",
    	    meetingNumber: "${ZoomUrl['mn']}",
    	    userName: (function () {
    	      if ("${ZoomUrl['name']}") {
    	        try {
    	          return testTool.b64DecodeUnicode("${ZoomUrl['name']}");
    	        } catch (e) {
    	          return "${ZoomUrl['name']}";
    	        }
    	      }
    	      return (
  	    	        "CDN#" +
  	    	        tmpArgs.version +
  	    	        "#" +
  	    	        testTool.detectOS() +
  	    	        "#" +
  	    	        testTool.getBrowserInfo()
    	      );
    	    })(),
    	    passWord: "${ZoomUrl['pwd']}",
    	    //해당 부분이 후에는 마이페이지로 이동하게 하기
    	    leaveUrl: "${pageContext.request.contextPath }", 
    	    role: parseInt("${ZoomUrl['role']}", 10),
    	    userEmail: (function () {
    	      try {
    	        return testTool.b64DecodeUnicode("${ZoomUrl['email']}");
    	      } catch (e) {
    	        return "${ZoomUrl['email']}";
    	      }
    	    })(),
    	    lang: "${ZoomUrl['lang']}",
    	    signature: $("[name=signature]").val() || "",
    	    china: "${ZoomUrl['china']}" === "1",
    	  };

    	  // a tool use debug mobile device
    	  if (testTool.isMobileDevice()) {
    	    vConsole = new VConsole();
    	  }
    	  console.log(JSON.stringify(ZoomMtg.checkSystemRequirements()));

    	  // it's option if you want to change the WebSDK dependency link resources. setZoomJSLib must be run at first
    	  // ZoomMtg.setZoomJSLib("https://source.zoom.us/2.1.1/lib", "/av"); // CDN version defaul
    	  if (meetingConfig.china)
    	    ZoomMtg.setZoomJSLib("https://jssdk.zoomus.cn/2.1.1/lib", "/av"); // china cdn option
    	  ZoomMtg.preLoadWasm();
    	  ZoomMtg.prepareJssdk();
    	  function beginJoin(signature) {
    	    ZoomMtg.init({
    	      leaveUrl: meetingConfig.leaveUrl,
    	      webEndpoint: meetingConfig.webEndpoint,
    	      disableCORP: !window.crossOriginIsolated, // default true
    	      // disablePreview: false, // default false
    	      success: function () {
    	        console.log(meetingConfig);
    	        console.log("signature", signature);
    	        ZoomMtg.i18n.load(meetingConfig.lang);
    	        ZoomMtg.i18n.reload(meetingConfig.lang);
    	        ZoomMtg.join({
    	          meetingNumber: meetingConfig.meetingNumber,
    	          userName: meetingConfig.userName,
    	          signature: signature,
    	          apiKey: meetingConfig.apiKey,
    	          userEmail: meetingConfig.userEmail,
    	          passWord: meetingConfig.passWord,
    	          success: function (res) {
    	            console.log("join meeting success");
    	            console.log("get attendeelist");
    	            ZoomMtg.getAttendeeslist({});
    	            ZoomMtg.getCurrentUser({
    	              success: function (res) {
    	                console.log("success getCurrentUser", res.result.currentUser);
    	              },
    	            });
    	          },
    	          error: function (res) {
    	            console.log(res);
    	          },
    	        });
    	      },
    	      error: function (res) {
    	        console.log(res);
    	      },
    	    });

    	    ZoomMtg.inMeetingServiceListener('onUserJoin', function (data) {
    	      console.log('inMeetingServiceListener onUserJoin', data);
    	    });
    	  
    	    ZoomMtg.inMeetingServiceListener('onUserLeave', function (data) {
    	      console.log('inMeetingServiceListener onUserLeave', data);
    	    });
    	  
    	    ZoomMtg.inMeetingServiceListener('onUserIsInWaitingRoom', function (data) {
    	      console.log('inMeetingServiceListener onUserIsInWaitingRoom', data);
    	    });
    	  
    	    ZoomMtg.inMeetingServiceListener('onMeetingStatus', function (data) {
    	      console.log('inMeetingServiceListener onMeetingStatus', data);
    	    });
    	  }

    	  beginJoin(meetingConfig.signature);
    	};

    </script>
</body>

</html>