###!
Mercury Editor is a Coffeescript and jQuery based WYSIWYG editor released under the MIT License.
Documentation and other useful information can be found at https://github.com/jejacks0n/mercury

Copyright (c) 2013 Jeremy Jackson
###

@Mercury ||= {}

Mercury.configuration =

  # Logging
  # You can enable logging for debugging purposes. Notifications are always displayed as they represent potential
  # problems, and console.error will be used unless it's unavailable. In those cases an alert or error will be thrown
  # based on what notifier you choose to use. Use false if you don't care about fallbacks.
  #
  logging:
    enabled    : true
    notifier   : 'error'                                   # alert or throw an error - 'alert', 'error', or false.


  # Localization
  # Mercury comes with translation files (contributed by the community) for several languages. To add a translation you
  # must first require the locale(s) you want to have support for, enable, and set a preferred locale (to an included
  # locale.)
  #
  localization:
    enabled    : true
    preferred  : 'en-US'                                   # preferred locale - if the user locale isn't supported


  # Uploading
  # When enabled you can drag and drop images/files onto a given region and that file will be uploaded. It's expected
  # that the server respond with JSON containing a url. How the file is inserting into the region it was dropped on is
  # determined by the region itself and some regions may not allow all file types.
  #
  uploading:
    enabled    : true
    saveUrl    : '/mercury/uploads'                        # save url
    saveName   : 'file'                                    # param that will be set for the image data
    mimeTypes  : ['image/jpeg', 'image/gif', 'image/png']  # allowed file types
    maxSize    : 5242880                                   # max size - 5.00 Mb


  # Templates
  # By default Mercury provides all templates as JST templates that are loaded statically, however to provide more
  # flexibility if a template isn't found locally, an synchronous ajax request will be made to the server to fetch the
  # content.
  #
  templates:
    enabled    : true
    prefixUrl  : '/mercury/templates'                      # ajax path prefix for fallback JST templates.


  # Regions
  # Mercury looks for elements that have a data-mercury="type" attribute. This attribute is used to declare what type of
  # region a given element should be. When saving, each region is serialized with a name and data that it might want to
  # pass back to the server, and the identifier attribute is used as a unique name.
  #
  regions:
    attribute  : 'data-mercury'                            # data attribute used to declare the region type
    identifier : 'id'                                      # attribute used for name when serializing

    # The image region is typically an image tag and what's sent back to the server on serialization is the source of
    # that image. It allows draging/dropping images onto itself, and maintains a history so you can undo/redo your
    # changes.
    #
    image:
      mimeTypes: ['image/jpeg']                            # file types - overrides general uploading configuration.

    # The gallery region is provided an an example of how you can easily (generally speaking) create your own regions.
    # It allows drag/drop of images and provides a simple implementation of a slide show with the ability to remove
    # items. You can use this as an example of how you could embed an entire backbone app within a region.
    #
    gallery:
      mimeTypes: ['image/jpeg']                            # file types - overrides general uploading configuration.