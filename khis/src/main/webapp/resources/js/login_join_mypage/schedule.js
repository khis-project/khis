function initCalendar(events) {
  // calendar element 취득
  var calendarEl = $('#calendar')[0];
  // full-calendar 생성하기
  var calendar = new FullCalendar.Calendar(calendarEl, {
    height: '600px', // calendar 높이 설정
    displayEventEnd: true,
    expandRows: true, // 화면에 맞게 높이 재설정
    slotMinTime: '08:00', // Day 캘린더에서 시작 시간
    slotMaxTime: '20:00', // Day 캘린더에서 종료 시간
    // 해더에 표시할 툴바
    headerToolbar: {
      left: 'prev,next today',
      center: 'title',
      right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
    },
    initialView: 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
    navLinks: true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
    nowIndicator: true, // 현재 시간 마크
    dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
    locale: 'ko', // 한국어 설정
    select: function(arg) { // 캘린더에서 드래그로 이벤트를 생성할 수 있다.
      var title = prompt('Event Title:');
      if (title) {
        calendar.addEvent({
          title: title,
          start: arg.start,
          end: arg.end,
          allDay: arg.allDay
        })
      }
      calendar.unselect()
    },
    eventDidMount:function(info){
      console.log(info);
      var {event:{title}} = info;
      var [coName, ...title] = title.split(' ');
      title = title.join(' ');
      info.el.title = `제목: ${title}\n회사명: ${coName}\n면접시간: ${info.timeText}`;
    },
    // 이벤트
    events: events
  });
  // 캘린더 랜더링
  calendar.render();
}