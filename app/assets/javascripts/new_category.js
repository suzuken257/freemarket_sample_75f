$(function(){

  function buildHTML(categories){
    let options = ``
    $.each(categories, function(i, category) {
       options += `<option value=${category.id}>${category.name}</option>`
    });
    var html =
    `<select id="child-form">
    <option value="---">---${options}</option>
    </select>`
    return html;
  }
  $("#parent-form").on("change",function(){
    // 親ボックスのidを取得してそのidをAjax通信でコントローラーへ送る
    var parentValue = document.getElementById("parent-form").value;
    $.ajax({
      url: '/items/get_category_children',
      type: "GET",
      data: {
        parent_id: parentValue // 親ボックスの値をparent_idという変数にする。
      },
      dataType: 'json'
    })
    .done(function(data) {
      var html = buildHTML(data);
      $('.sell__main__content__form__box__group__child').append(html);
    })
  });
  function grandHTML(categories){
    let options = ``
    $.each(categories, function(i, category) {
       options += `<option value=${category.id}}>${category.name}</option>`
    });
    var html =
    `<select name="item[category_id]">
    <option value="---">---${options}</option>
    </select>`
    return html;
  }
  $(document).on("change","#child-form",function(){
    var parentValue = document.getElementById("child-form").value;
    $.ajax({
      url: '/items/get_category_grandchildren',
      type: "GET",
      data: {
        child_id: parentValue 
      },
      dataType: 'json'
    })
    .done(function(data) {
      var html = grandHTML(data);
      $('.sell__main__content__form__box__group__grandchild').append(html);
    })
  });
});