(function(module) {
	"use strict";

	var Theme = {};

	Theme.defineWidgetAreas = function(areas, callback) {
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
				'name': 'Category Right Sidebar',
				'template': 'category.tpl',
				'location': 'sidebar'
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
			}
		]);

		callback(null, areas);
	};

	module.exports = Theme;

}(module));