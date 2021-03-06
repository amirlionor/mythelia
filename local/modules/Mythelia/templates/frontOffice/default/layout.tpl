<!doctype html>
{* Declare assets directory, relative to template base directory *}
{declare_assets directory='assets/dist'}
{* Set the default translation domain, that will be used by {intl} when the 'd' parameter is not set *}
{default_translation_domain domain='fo.default'}

{* -- Define some stuff for Smarty ------------------------------------------ *}
{config_load file='variables.conf'}
{block name="init"}{/block}
{block name="no-return-functions"}{/block}
{assign var="store_name" value={config key="store_name"}}
{assign var="store_description" value={config key="store_description"}}
{assign var="lang_code" value={lang attr="code"}}
{assign var="lang_locale" value={lang attr="locale"}}
{if not $store_name}{assign var="store_name" value={intl l='Thelia V2'}}{/if}
{if not $store_description}{assign var="store_description" value={$store_name}}{/if}

{* paulirish.com/2008/conditional-stylesheets-vs-css-hacks-answer-neither *}
<!--[if lt IE 7 ]><html class="no-js oldie ie6" lang="{$lang_code}"> <![endif]-->
<!--[if IE 7 ]><html class="no-js oldie ie7" lang="{$lang_code}"> <![endif]-->
<!--[if IE 8 ]><html class="no-js oldie ie8" lang="{$lang_code}"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html lang="{$lang_code}" class="no-js"> <!--<![endif]-->
<head>
    {hook name="main.head-top"}
    {* Test if javascript is enabled *}
    <script>(function(H) { H.className=H.className.replace(/\bno-js\b/,'js') } )(document.documentElement);</script>

    <meta charset="utf-8">

    {* Page Title *}
    <title>{block name="page-title"}{strip}{if $page_title}{$page_title}{elseif $breadcrumbs}{foreach from=$breadcrumbs|array_reverse item=breadcrumb}{$breadcrumb.title|unescape} - {/foreach}{$store_name}{else}{$store_name}{/if}{/strip}{/block}</title>

    {* Meta Tags *}
    <meta name="generator" content="{intl l='Thelia V2'}">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    {block name="meta"}
        <meta name="description" content="{if $page_description}{$page_description}{else}{$store_description|strip|truncate:120}{/if}">
    {/block}

    {stylesheets file='assets/dist/css/thelia.min.css'}
        <link rel="stylesheet" href="{$asset_url}">
    {/stylesheets}
 

    {hook name="main.stylesheet"}

    {block name="stylesheet"}{/block}

    {* Favicon *}
    <link rel="shortcut icon" type="image/x-icon" href="{image file='assets/dist/img/favicon.ico'}">
    <link rel="icon" type="image/png" href="{image file='assets/dist/img/favicon.png'}" />

    {* Feeds *}
    <link rel="alternate" type="application/rss+xml" title="{intl l='All products'}" href="{url path="/feed/catalog/%lang" lang=$lang_locale}" />
    <link rel="alternate" type="application/rss+xml" title="{intl l='All contents'}" href="{url path="/feed/content/%lang" lang=$lang_locale}" />
    <link rel="alternate" type="application/rss+xml" title="{intl l='All brands'}"   href="{url path="/feed/brand/%lang" lang=$lang_locale}" />
    {block name="feeds"}{/block}

    {* HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries *}
    <!--[if lt IE 9]>
    <script src="//cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.js"></script>
    {javascripts file="assets/dist/js/vendors/html5shiv.min.js"}
        <script>window.html5 || document.write('<script src="{$asset_url}"><\/script>');</script>
    {/javascripts}

    <script src="//cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.js"></script>
    {javascripts file="assets/dist/js/vendors/respond.min.js"}
        <script>window.respond || document.write('<script src="{$asset_url}"><\/script>');</script>
    {/javascripts}
    <![endif]-->

    {hook name="main.head-bottom"}
</head>
<body class="{block name="body-class"}{/block}" itemscope itemtype="http://schema.org/WebPage">
    {hook name="main.body-top"}
    <a class="sr-only" href="#content">{intl l="Skip to content"}</a>
    <div class="page" role="document">
        <div class="header-container" itemscope itemtype="http://schema.org/WPHeader">
            {hook name="main.header-top"}
            <div class="navbar navbar-default navbar-secondary" itemscope itemtype="http://schema.org/SiteNavigationElement">
                <div class="container">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".nav-secondary">
                            <span class="sr-only">{intl l="Toggle navigation"}</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand visible-xs" href="{navigate to="index"}">{$store_name}</a>
                    </div>
                    {ifhook rel="main.navbar-secondary"}
                        {* Place everything within .nav-collapse to hide it until above 768px *}
                        <nav class="navbar-collapse collapse nav-secondary" role="navigation" aria-label="{intl l="Secondary Navigation"}">
                            {hook name="main.navbar-secondary"}
                        </nav>
                    {/ifhook}
                </div>
            </div>
            <header class="container" role="banner">
                <div class="header row">
                    <h1 class="logo container hidden-xs">
                        <a href="{navigate to="index"}" title="{$store_name}">
                            {$image = {image file='assets/dist/img/logo.png' failsafe=true}}
                            {if $image == null}
                                {$image = {image file='assets/dist/img/logo.gif' failsafe=true}}
                            {/if}
                            <img src="{$image}" alt="{$store_name}">
                        </a>
                    </h1>
                    {hook name="main.navbar-primary"}
                </div>
            </header>
            {hook name="main.header-bottom"}
        </div>
        <main class="main-container" role="main">
            <div class="container">
                {hook name="main.content-top"}
                {block name="breadcrumb"}{include file="misc/breadcrumb.tpl"}{/block}
                <div id="content">{block name="main-content"}{/block}</div>
                {hook name="main.content-bottom"}
            </div>
        </main>
        <section class="footer-container" itemscope itemtype="http://schema.org/WPFooter">
            {ifhook rel="main.footer-top"}
                <section class="footer-block">
                    <div class="container">
                        <div class="blocks row">
                            {hook name="main.footer-top"}
                        </div>
                    </div>
                </section>
            {/ifhook}
            {elsehook rel="main.footer-top"}
                <section class="footer-banner">
                    <div class="container">
                        <div class="banner row banner-col-3">
                            <div class="col col-sm-4">
                                <span class="fa fa-truck fa-flip-horizontal"></span>
                                {intl l="Free shipping"} <small>{intl l="Orders over $50"}</small>
                            </div>
                            <div class="col col-sm-4">
                                <span class="fa fa-credit-card"></span>
                                {intl l="Secure payment"} <small>{intl l="Multi-payment platform"}</small>
                            </div>
                            <div class="col col-sm-4">
                                <span class="fa fa-info"></span>
                                {intl l="Need help ?"} <small>{intl l="Questions ? See our F.A.Q."}</small>
                            </div>
                        </div>
                    </div>
                </section>
            {/elsehook}
            {ifhook rel="main.footer-body"}
                <section class="footer-block">
                    <div class="container">
                        <div class="blocks row">
                            {hookblock name="main.footer-body"  fields="id,class,title,content"}
                            {forhook rel="main.footer-body"}
                                <div class="col col-sm-3">
                                    <section {if $id} id="{$id}"{/if} class="block {if $class} block-{$class}{/if}">
                                        <div class="block-heading"><h3 class="block-title">{$title}</h3></div>
                                        <div class="block-content">
                                            {$content nofilter}
                                        </div>
                                    </section>
                                </div>
                            {/forhook}
                            {/hookblock}
                        </div>
                    </div>
                </section>
            {/ifhook}
            {ifhook rel="main.footer-bottom"}
                <footer class="footer-info" role="contentinfo">
                    <div class="container">
                        <div class="info row">
                            <div class="col-lg-9">
                                {hook name="main.footer-bottom"}
                            </div>
                            <div class="col-lg-3">
                                <section class="copyright">{intl l="Copyright"} &copy; <time datetime="{'Y-m-d'|date}">{'Y'|date}</time> <a href="http://thelia.net" rel="external">Thelia</a></section>
                            </div>
                        </div>
                    </div>
                </footer>
            {/ifhook}
            {elsehook rel="main.footer-bottom"}
                <footer class="footer-info" role="contentinfo">
                    <div class="container">
                        <div class="info row">
                            <nav class="nav-footer col-lg-9" role="navigation">
                                <ul class="list-unstyled list-inline">
                                    {$folder_information={config key="information_folder_id"}}
                                    {if $folder_information}
                                        {loop name="footer_links" type="content" folder=$folder_information}
                                            <li><a href="{$URL nofilter}">{$TITLE}</a></li>
                                        {/loop}
                                    {/if}
                                    <li><a href="{url path="/contact"}">{intl l="Contact Us"}</a></li>
                                </ul>
                            </nav>
                            <section class="copyright col-lg-3">{intl l="Copyright"} &copy; <time datetime="{'Y-m-d'|date}">{'Y'|date}</time> <a href="http://thelia.net" rel="external">Thelia</a></section>
                        </div>
                    </div>
                </footer>
            {/elsehook}
        </section>
    </div>
    {block name="before-javascript-include"}{/block}
   <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
    {javascripts file="assets/dist/js/vendors/jquery.min.js"}
        <script>window.jQuery || document.write('<script src="{$asset_url}"><\/script>');</script>
    {/javascripts}
    <script src="//ajax.aspnetcdn.com/ajax/jquery.validate/1.13.1/jquery.validate.min.js"></script>
    {* do no try to load messages_en, as this file does not exists *}
    {if $lang_code != 'en'}
        <script src="//ajax.aspnetcdn.com/ajax/jquery.validate/1.13.1/localization/messages_{$lang_code}.js"></script>
    {/if}
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    {javascripts file="assets/dist/js/vendors/bootstrap.min.js"}
        <script>if(typeof($.fn.modal) === 'undefined') { document.write('<script src="{$asset_url}"><\/script>'); }</script>
    {/javascripts}

    {javascripts file="assets/dist/js/vendors/bootbox.js"}
        <script src="{$asset_url}"></script>
    {/javascripts}
    {hook name="main.after-javascript-include"}
    {block name="after-javascript-include"}{/block}
    {hook name="main.javascript-initialization"}
    <script>
       var addCartMessageUrl = "{url path='ajax/addCartMessage'}";
    </script>
    {block name="javascript-initialization"}{/block}
    <script src="{javascript file='assets/dist/js/thelia.min.js'}"></script>
    {hook name="main.body-bottom"}
</body>
</html>
