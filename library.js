
"use strict";

var library = {};

library.defineWidgetAreas = function(areas, callback) {
	areas = areas.concat([
		{
			'name': 'MOTD',
			'template': 'home.tpl',
			'location': 'motd'
		},
		{
			'name': 'Homepage Footer',
			'template': 'home.tpl',
			'location': 'footer'
		},
		{
			'name': 'Category Left Sidebar',
			'template': 'category.tpl',
			'location': 'lsidebar'
		},
		{
			'name': 'Category Right Sidebar',
			'template': 'category.tpl',
			'location': 'sidebar'
		},
		{
			'name': 'Topic Left Sidebar',
			'template': 'topic.tpl',
			'location': 'lsidebar'
		},
		{
			'name': 'Topic Right Sidebar',
			'template': 'topic.tpl',
			'location': 'sidebar'
		},
		{
			'name': 'Topic Footer',
			'template': 'topic.tpl',
			'location': 'footer'
		},
		{
			'name': 'Tag Left Sidebar',
			'template': 'tag.tpl',
			'location': 'lsidebar'
		},
		{
			'name': 'Tag Right Sidebar',
			'template': 'tag.tpl',
			'location': 'sidebar'
		},
	]);

	callback(null, areas);
};

module.exports = library;