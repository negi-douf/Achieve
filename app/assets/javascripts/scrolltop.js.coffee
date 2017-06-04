# クロージャになってる？
ready = ->
  
  # scroll メソッドを定義
  $(window).scroll ->
    
    # ボタンを取得
    element = $("#page-top-btn")
    
    # なにこれ？
    visible = element.is(":visible")
    
    height = $(window).scrollTop()
    
    if height > 400
      element.fadeIn() if !visible
    else
      element.fadeOut()
    
    # クリックされたらゆっくり上まで戻る
    # scrollTop: 0 は一番上までという意味
    $(document).on "click", "#move-page-top", ->
      $("html, body").animate( (scrollTop: 0), "slow")


# ここで ready するメソッドを指定してるのか
$(document).ready(ready)

# on() でトリガと処理を指定できる
$(document).on("page:load", ready)
