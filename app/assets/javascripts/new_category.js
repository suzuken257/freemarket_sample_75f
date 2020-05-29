$(function(){
  function buildHTML(categories){
    $.each(categories, function() {
      options += `<option value=${---}>${---}</option>`
    });
    var html =
    `<select>
    ${options}
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
      $('.sell__main__content__form__box__group__select__child').append(html);
    })
  });
  
});