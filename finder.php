<?php

return \StubsGenerator\Finder::create()
    ->in('wp-content/plugins/advanced-custom-fields-pro')
    ->notPath('assets')
    ->notPath('lang')
    ->notPath('includes/deprecated')
    ->notPath('includes/admin/views')
    ->notPath('pro/admin/views')
    ->notPath('pro/assets')
    ->sortByName()
;
