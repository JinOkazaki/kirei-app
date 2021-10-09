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
      const user = XHR.response.user;
      if (item.text == "") {
        alert("コメントを入力してください!");
      }
      else {
      const html = `
      <div class="comment-dates" style="width: 75%; margin: 0 auto; padding-bottom:10px;">
        <div class="comment-text">
          <a href="/users/${user.id}" style="color:black;" onMouseOut="this.style.opacity='1'" onMouseOver="this.style.opacity='0.5'"> ${user.nickname}</a>
          <span style="color: rgb(78, 44, 44); margin-left:10px">${item.text}</span>
          <a href="/posts/${item.post_id}/comments/${item.id}" data-method="delete" class="fa fa-trash fa-1x" style="float: right; color: deepskyblue; display: inline"></a>
        </div>
        <hr>
      </div>
       `;
      list.insertAdjacentHTML("afterbegin",html);
      formText.value = "";
      };
    };
  });
};

window.addEventListener('load', post);
