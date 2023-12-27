
//지역모달창
const locationModal = document.querySelector('.location-modal');
const btnLocationOpenModal = document.querySelector('.rv-locationAndDateBox-location');


btnLocationOpenModal.addEventListener("click", () => {
    locationModal.style.display = "flex";
});

const locationCloseBtn = document.querySelector(".location-modal-close-Btn");
locationCloseBtn.addEventListener("click", e => {
    locationModal.style.display = "none";
});

locationModal.addEventListener("click", e => {
    const evTarget = e.target
    if(evTarget.classList.contains("location-modal")) {
        locationModal.style.display = "none";
    }
});

//달력모달창
const dateModal = document.querySelector('.date-modal');
const btnDateOpenModal = document.querySelector('.rv-locationAndDateBox-date');

btnDateOpenModal.addEventListener("click", () => {
    dateModal.style.display = "flex";
});

const dateCloseBtn = document.querySelector(".date-modal-close-Btn");
dateCloseBtn.addEventListener("click", e => {
    dateModal.style.display = "none";
});

dateModal.addEventListener("click", e => {
    const evTarget2 = e.target
    if(evTarget2.classList.contains("date-modal")) {
        dateModal.style.display = "none";
    }
});


/*<!-- 무한스크롤 -->
    <!-- <h1>무한스크롤</h1>
  <section>
    <div class="box">
      <p>
        1번째 블록
      </p>
    </div>
    <div class="box">
      <p>
        2번째 블록
      </p>
    </div>
  </section>
  <script>
    var count = 2;
    window.onscroll = function(e) {
      console.log(window.innerHeight , window.scrollY,document.body.offsetHeight)
      if((window.innerHeight + window.scrollY) >= document.body.offsetHeight) { 
        setTimeout(function(){
          var addContent = document.createElement("div");
          addContent.classList.add("box")
          addContent.innerHTML = `<p>${++count}번째 블록</p>`
          document.querySelector('section').appendChild(addContent);
        }, 1000)  
      }
    }
  </script> -->*/