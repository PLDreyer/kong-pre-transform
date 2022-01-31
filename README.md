Kong Pre Transformer
====================

Plugin is used to transform incoming requests before they reach other plugins
or services.

Features
========

- remove incoming headers


Dependencies
============
nill

Configuration
=================================
```lua
config = {
    remove = {
        headers = {
            "example-header-one",
            "example-header-two",
            ...
        }
    }
}
```
