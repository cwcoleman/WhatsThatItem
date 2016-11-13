
<title>Search results...</title>
<body>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>2 Rows Frames Layout (header frame)</title>
		<style type="text/css">

		body {
			margin: 0;
			padding: 0;
			overflow: hidden;
			height: 100%;
			max-height: 100%;
			font-family:Sans-serif;
			line-height: 1.5em;
		}

		#header {
			position: absolute;
			top: 0;
			left: 0;
			width: 100%;
			height: 100px;
			overflow: hidden; /* Disables scrollbars on the navigation frame. To enable scrollbars, change "hidden" to "scroll" */
			background: #00446B;
		}

		#logo {
			padding:10px;
			float:left;
			color: #FFFFFF;
		}

		main {
			position: fixed;
			top: 100px; /* Set this to the height of the header */
			left: 0;
			right: 0;
			bottom: 0;
			overflow: auto;
			background: #fff;
		}

		.innertube {
			margin: 15px; /* Provides padding for the content */
		}

		p {
			color: #FFF;
		}

		/* Menu */
		nav {
			margin:0 auto;
			padding:0;
			float:right;
		}
		nav ul {
			list-style:none;
			padding:0;
			float:left;
		}
		nav ul li {
			margin:0;
			padding:0 0 0 8px;
			float:left;
		}
		nav ul li a {
			display:block;
			margin:0;
			padding:8px 20px;
			color:white;
			text-decoration:none;
		}
		nav ul li.active a, #top-nav ul li a:hover {
			color:#d3d3f9;
		}

		/*IE6 fix*/
		* html body{
			padding: 100px 0 0 0; /* Set the first value to the height of the header */
		}

		* html main{
			height: 100%;
			width: 100%;
		}

		</style>

	</head>

	<body>

		<header id="header">
			<div id="logo">
				<h1>FergiFinder</h1>
			</div>
			<nav>
				<div class="innertube">
				<ul>
					<li><a href="#">Inventory</a></li>
					<li><a href="#">Create Job</a></li>
					<li><a href="#">Job History</a></li>
					<li><a href="#">Invoice</a></li>
					<li><a href="#">Search</a></li>
				</ul>
				</div>
			</nav>
		</header>

		<main>
			<div class="innertube">

				<h1>Search Results</h1>
				<p><p>Current number of results found are: {{len(search_results)}}</p>
<table BORDER="2">
    % for key, value in search_results.iteritems():
    <tr>
        <th>QTY</th><th>Part Number</th><th>Name</th><th>Description</th>
    </tr>
    <tr>
        <td><form>
        <style>
        input {
            width: 50px;
        }
        </style>
        <input name="{{key}}" type="number">
        </form>
            </td>
        <td style="white-space: nowrap">{{key}}</td>
        <td><pre>{{value['name']}}</pre></td>
        <td><pre>{{value['short_desc']}}</pre></td>
        <td><pre><img src="{{value['image']}}" alt="{{value['name']}}" /></pre></td>
    </tr>
    % end
</table></p>

			</div>
		</main>
</body>
