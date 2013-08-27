###Browl.js - simple in browser notifications

<a target="_blank" href="https://dl.dropboxusercontent.com/u/33989136/browl/index.html">Demo</a>

Browl notifications are just elements that include a `browl` class and a `data-timeout` value like:

<pre>
&lt;div class="browl" data-timeout="2">Hello world!&lt;div&gt;
</pre>

Browl has no dependencies.

All you need to do is include `browl.js` _after_ all of your markup (eg. just before closing the `body` element):

<pre>
&lt;script src="browl.js"&gt;&lt;/script&gt;
</pre>

Of course ou can also create browls dynamically (as in the demo) by writing something similar to:

<pre>
var elem = document.createElement('div');
elem.setAttribute('data-timeout', '1');
elem.classList.add('browl');
elem.innerHTML = text.value;
document.getElementsByTagName('body')[0].appendChild(elem);
</pre>

###Todo

[ ] - stacking: currently multiple notifications overlap 