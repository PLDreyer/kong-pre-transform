Kong Pre Transform
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

Implementation
=============
- Docker Base Kong:v2.6
- Kong Config or Env
  - extend lua package path
  - update plugins to integrate

