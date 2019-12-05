<?php

return \StubsGenerator\Finder::create()
    ->in('wp-content/plugins/advanced-custom-fields-pro')
    ->notPath('assets')
    ->notPath('lang')
    ->sortByName()
;
