<?php

declare(strict_types=1);

use Rector\Config\RectorConfig;
use Rector\Set\ValueObject\LevelSetList;
use Rector\Set\ValueObject\SetList;
use Rector\Symfony\Set\SymfonySetList;

return RectorConfig::configure()
    ->withPaths([
        __DIR__ . '/config',
        __DIR__ . '/public',
        __DIR__ . '/src',
    ])
    ->withSkip([
        __DIR__ . '/var',
        __DIR__ . '/vendor',
    ])
    ->withPhpSets(
        php85: true,
    )
    ->withSets([
        // Symfony upgrade to 6.4
        SymfonySetList::SYMFONY_64,
        SymfonySetList::SYMFONY_CODE_QUALITY,
        SymfonySetList::SYMFONY_CONSTRUCTOR_INJECTION,
        
        // Code quality improvements
        SetList::CODE_QUALITY,
        SetList::DEAD_CODE,
        SetList::EARLY_RETURN,
        SetList::TYPE_DECLARATION,
        SetList::PRIVATIZATION,
        
        // PHP 8.x improvements
        LevelSetList::UP_TO_PHP_82,
        LevelSetList::UP_TO_PHP_83,
        LevelSetList::UP_TO_PHP_84,
        LevelSetList::UP_TO_PHP_85,
    ])
    ->withPreparedSets(
        deadCode: true,
        codeQuality: true,
        typeDeclarations: true,
        privatization: true,
        earlyReturn: true,
    )
    ->withImportNames(
        importShortClasses: false,
        removeUnusedImports: true,
    );
