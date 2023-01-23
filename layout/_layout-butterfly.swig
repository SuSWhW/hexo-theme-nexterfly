<!DOCTYPE html>
<html lang="{{ config.language }}">
<head>
  {{ partial('_partials/head/head.swig', {}, {cache: theme.cache.enable}) }}
  {% include '_partials/head/head-unique.swig' %}
  {{- next_inject('head') }}
  <title>{% block title %}{% endblock %}</title>
  {{ partial('_third-party/analytics/index.swig', {}, {cache: theme.cache.enable}) }}
  {{ partial('_scripts/noscript.swig', {}, {cache: theme.cache.enable}) }}
</head>

<body itemscope itemtype="http://schema.org/WebPage">
    <div class="page" id="body-wrap">
        <header class="full_page" id="page-header" style="background-image: url('/img/background.jpg')">
            <div id="site-info">
                <h1 id="site-title"><font color="white">Nexterfly</font></h1>
                <div id="site-subtitle"><font color="white"><span id="subtitle">希望你别像风，在我这里面掀起万翻般波澜，却又跟云去了远方。</span></font></div>
            </div>
            <div id="scroll-down"><i class="fas fa-angle-down scroll-down-effects"></i></div>
        </header>
    </div>
    <div>
        <script src="/js/utils-butterfly.js"></script>
        <script src="/js/main.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@fancyapps/ui/dist/fancybox.umd.min.js"></script>
        <div class="js-pjax">
            <script>window.typedJSFn = {
                    init: (str) => {
                        window.typed = new Typed('#subtitle', Object.assign({
                            strings: str,
                            startDelay: 300,
                            typeSpeed: 150,
                            loop: true,
                            backSpeed: 50,
                        }, null))
                    },
                    run: (subtitleType) => {
                        if (false) {
                            if (typeof Typed === 'function') {
                                subtitleType()
                            } else {
                                getScript('https://cdn.jsdelivr.net/npm/typed.js/lib/typed.min.js').then(subtitleType)
                            }
                        } else {
                            subtitleType()
                        }
                    }
                }
            </script>
            <script>function subtitleType() {
                    fetch('https://v1.hitokoto.cn')
                        .then(response => response.json())
                        .then(data => {
                            if (false) {
                                const from = '出自 ' + data.from
                                const sub = []
                                sub.unshift(data.hitokoto, from)
                                typedJSFn.init(sub)
                            } else {
                                document.getElementById('subtitle').innerHTML = data.hitokoto
                            }
                        })
                }
                typedJSFn.run(subtitleType)
            </script>
        </div>
        <script async="" data-pjax="" src="//busuanzi.ibruce.info/busuanzi/2.3/busuanzi.pure.mini.js"></script>
    </div>
    <div id="phraseJoinewrskdfdswerhnyikyofd" data-v-app="">
        <!---->
        <!---->
        <!---->
    </div>
  <div class="container{%- if theme.motion.enable %} use-motion{%- endif %}">
    <div class="headband"></div>

    <header class="header" itemscope itemtype="http://schema.org/WPHeader">
      <div class="header-inner">{% include '_partials/header/index.swig' %}</div>
    </header>

    {{ partial('_partials/widgets.swig', {}, {cache: theme.cache.enable}) }}

    <main class="main">
      <div class="main-inner">
        <div class="content-wrap">
          {% include '_partials/header/sub-menu.swig' %}
          <div class="content {% block class %}{% endblock %}">
            {% block content %}{% endblock %}
          </div>
          {% include '_partials/comments.swig' %}
        </div>
        {%- if theme.sidebar.display !== 'remove' %}
          {% block sidebar %}{% endblock %}
        {%- endif %}
      </div>
    </main>

    <footer class="footer">
      <div class="footer-inner">
        {% include '_partials/languages.swig' %}
        {{ partial('_partials/footer.swig', {}, {cache: theme.cache.enable}) }}
        {{ partial('_third-party/statistics/index.swig', {}, {cache: theme.cache.enable}) }}
      </div>
    </footer>
  </div>

  {{ partial('_scripts/index.swig', {}, {cache: theme.cache.enable}) }}
  {{ partial('_third-party/index.swig', {}, {cache: theme.cache.enable}) }}

  {%- if theme.pjax %}
    <div id="pjax">
  {%- endif %}
  {% include '_third-party/math/index.swig' %}
  {% include '_third-party/quicklink.swig' %}

  {{- next_inject('bodyEnd') }}
  {%- if theme.pjax %}
    </div>
  {%- endif %}
</body>
</html>