function post (){
  const submit = document.getElementById("submit");
  submit.addEventListener("click", (e) => {
    e.preventDefault();
    const form = document.getElementById("form");
    const formData = new FormData(form);
    const postCommentsPath = form.getAttribute("action")
    const XHR = new XMLHttpRequest();
    XHR.open("POST",postCommentsPath,true);
    XHR.responseType = "json";
    XHR.send(formData);
    XHR.onload = () => {
      const list = document.getElementById("list")
      const formText = document.getElementById("text");
      const item = XHR.response.comment;
      if (item.text == "") {
        alert("コメントを入力してください!");
      }
      else {
      const html = `
      <div class="comment">
        <div class="comment-date">
          投稿日時： ${item.created_at}
        </div>
        <div class="comment-text">
           ${item.text} 
        </div>
      </div>`;
      list.insertAdjacentHTML("afterend",html);
      formText.value = "";
      };
    };
  });
};

window.addEventListener('load', post);