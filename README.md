mailerの大まかな流れは、
（1）有効化トークンやダイジェストを関連付けておいた状態で、
（2）有効化トークンを含めたリンクをユーザーにメールで送信し、
（3）ユーザーがそのリンクをクリックすると有効化できるようにする、というものです

アカウントを有効化する段取り
ユーザーの初期状態は「有効化されていない」（unactivated）にしておく。

ユーザー登録が行われたときに、有効化トークンと、それに対応する有効化ダイジェストを生成する。

有効化ダイジェストはデータベースに保存しておき、有効化トークンはメールアドレスと一緒に、ユーザーに送信する有効化用メールのリンクに仕込んでおく。

ユーザーがメールのリンクをクリックしたら、アプリケーションはメールアドレスをキーにしてユーザーを探し、データベース内に保存しておいた有効化ダイジェストと比較することでトークンを認証する。

ユーザーを認証できたら、ユーザーのステータスを「有効化されていない」から「有効化済み」（activated）に変更する。


まとめ
有効化用メールのリンクにトークン。DBにダイジェスト。クリックした時に、二つが照合されて、有効になる。

<!-- 
<h1>Aboutだよ</h1>

<%= form_with(model: @post, local: true) do |f| %>
  <%= render 'shared/error_messages', object: f.object %>
  <div class="field">
    <!-- <%= f.text_area :content, placeholder: "Compose new post..." %> -->
  <!-- </div>
  <%= f.submit "Post", class: "btn btn-primary" %>
  <%# #画像ファイル挿入 %>
  <span class="image">
    <%= f.file_field :image, accept: "image/jpeg,image/gif,image/png" %>
    <%# <%= f.file_field :image %> 
  </span>
<% end %> -->

<!-- <%# これをCarrierWaveに変えるかも %>
<%# <script type="text/javascript">
  $("#post_image").bind("change", function() {
    var size_in_megabytes = this.files[0].size/1024/1024;
    if (size_in_megabytes > 5) {
      alert("Maximum file size is 5MB. Please choose a smaller file.");
      $("#post_image").val("");
    }
  }); -->
</script> %> -->



<!-------------- _post_form.html.erbのパーツ -------------------->



<%# 新規投稿画面 %>
<div class="container">
<div class="row">
<aside class="col-md-10">

<%= form_with(model: @post, local: true) do |f| %>
<%= render 'shared/error_messages', object: f.object %>

  <%= f.label :title, class: 'mb-3' %>
  <%= f.text_field :title, class: 'form-control form-control-lg' %>

  <%= f.label :tag, class: 'mb-3  form-label' %>
  <%= f.select :tag, ["移住", "ドイツ語", "生活", "食べ物", "街並み"], class: "form-control" %>

<%# 投稿 %>
<%# <div class="mb-3">
  <label for="exampleFormControlTextarea1" class="form-label">あなたのベルリンでの経験をシェアしよう。</label>
  <textarea class="form-control" id="exampleFormControlTextarea1" rows="30"></textarea>
</div> %>

<div class="field">
   <%= f.label :content, class: 'mb-3' %> 
   <%= f.text_area :content, "あなたのベルリンでの経験をシェアしよう。", class: "form-control", id: "exampleFormControlTextarea1", row: "30"  %>
</div>

<%# サムネ←一旦保留しています。 %>
<%# <div class="mb-3">
  <label for="formFileMultiple" class="form-label">サムネイル/ヘッダー画像</label>
  <input class="form-control" type="file" id="formFileMultiple" multiple>
</div> %>


<%= f.submit "Post", class: "btn btn-primary" %>

<% end %>

</aside>
</div>
</div>

<%# タイトル %>
<%# <div class="mb-3">
<input class="form-control form-control-lg" type="text" placeholder="タイトル" aria-label=".form-control-lg example">
</div>  %>

<%# tag %>
<%# タグ erbのformでselectがあった気がする。%>
<%# <label for="exampleDataList" class="form-label">投稿内容に関連するタグ</label>
<input class="form-control" list="datalistOptions" id="exampleDataList" placeholder="Type to search...">
<datalist id="datalistOptions">
  <option value="San Francisco">
  <option value="New York">
  <option value="Seattle">
  <option value="Los Angeles">
  <option value="Chicago">
</datalist> %>










































