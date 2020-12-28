(function(module) {
	"use strict";

	var Theme = {};

	Theme.defineWidgetAreas = function(areas, callback) {
		areas = areas.concat([
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

	module.exports = Theme;

}(module));