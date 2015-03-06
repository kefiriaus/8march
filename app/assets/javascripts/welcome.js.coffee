# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
new WOW().init();

jQuery ($) ->
  Share = {
    vkontakte: (purl, ptitle, pimg, text) ->
        url  = 'http://vkontakte.ru/share.php?';
        url += 'url='          + encodeURIComponent(purl);
        url += '&title='       + encodeURIComponent(ptitle);
        url += '&description=' + encodeURIComponent(text);
        url += '&image='       + encodeURIComponent(pimg);
        url += '&noparse=true';
        Share.popup(url);

    odnoklassniki: (purl, text) ->
        url  = 'http://www.odnoklassniki.ru/dk?st.cmd=addShare&st.s=1';
        url += '&st.comments=' + encodeURIComponent(text);
        url += '&st._surl='    + encodeURIComponent(purl);
        Share.popup(url);
    
    facebook: (purl, ptitle, pimg, text) ->
        url  = 'http://www.facebook.com/sharer.php?m2w&s=100';
        url += '&p[title]='     + encodeURIComponent(ptitle);
        url += '&p[summary]='   + encodeURIComponent(text);
        url += '&p[url]='       + encodeURIComponent(purl);
        url += '&p[images][0]=' + encodeURIComponent(pimg);
        Share.popup(url);
   
    facebookm: (purl, ptitle, pimg, text) ->
        url  = 'https://m.facebook.com/sharer.php?s=0';
        url += 'u='          + encodeURIComponent(purl);
        Share.popup(url);
 
    twitter: (purl, ptitle) ->
        url  = 'http://twitter.com/share?';
        url += 'text='      + encodeURIComponent(ptitle);
        url += '&url='      + encodeURIComponent(purl);
        url += '&counturl=' + encodeURIComponent(purl);
        Share.popup(url);

    mailru: (purl, ptitle, pimg, text) ->
        url  = 'http://connect.mail.ru/share?';
        url += 'url='          + encodeURIComponent(purl);
        url += '&title='       + encodeURIComponent(ptitle);
        url += '&description=' + encodeURIComponent(text);
        url += '&imageurl='    + encodeURIComponent(pimg);
        Share.popup(url);

    popup: (url) ->
        window.open(url,'','toolbar=0,status=0,width=626,height=436');
  };

  $(".share-facebook").on "click", (event) ->
    event.preventDefault();

    _url = $(this).data("share-url");
    _title = $(this).data("share-title");
    _img = $(this).data("share-img");
    _desc = $(this).data("share-desc");

    if _url.length and _title.length
      #FB.ui(
       #{
         #method: 'share_open_graph',
         #action_type: 'og.likes',
         #action_properties: JSON.stringify({
         #  object: _url
         #})
         #method: 'share',
         #href: _url
       #}, (response) -> );
      Share.facebookm(_url, _title, _img, _desc);

  $(".share-vk").on "click", (event) ->
    event.preventDefault();

    _url = $(this).data("share-url");
    _title = $(this).data("share-title");
    _img = $(this).data("share-img");
    _desc = $(this).data("share-desc");

    if _url.length and _title.length
      Share.vkontakte(_url, _title, _img, _desc);

  $('a.smooth-scroll').smoothScroll({
    speed: 800
  });
  ###
  $('#main').fullpage({
    scrollingSpeed: 500,
    verticalCentered: false,
    autoScrolling: false,
    fitToSection: true,
    scrollBar: true,
    normalScrollElements: '#think'
  });
  ###
