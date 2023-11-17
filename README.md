# FrankenPHP segfaulting issue with PHP Jit enabled

This repo is created by doing:
```bash
symfony local:new franken-segfault
cd franken-segfalt
symfony composer require runtime/frankenphp-symfony
```

I build a docker container starting from dunglas/frankenphp:latest-php8.2-alpine.

I enable what seems to me like a minimum amount of 'realistic' required PHP extensions:
`pdo`, `pdo_mysql`, `opcache` and `intl`.

I build the container, as seen in the example `build-container.sh`, and then I start a container by running `start-container.sh`.

This will segfault, if I set the php.ini option `opcache.jit_buffer_size` to something like `100M`.

I tried different values. But the moment I remove that line and rebuild and restart the container, it's working. I add that  line and rebuild and restart the container, it segfaults.

Increasing the `opcache.jit_buffer_size` seems to cause the segfault to 'take longer', but it still segfaults. It also segfaults with just 1 worker.


It does ***not*** segfault if not using worker-mode in FrankenPHP.