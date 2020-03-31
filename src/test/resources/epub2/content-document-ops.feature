Feature: EPUB 2.0.1 OPS Content Documenta
  
  Checks conformance to specification rules defined for EPUB 2 OPS Content Documents:
  http://idpf.org/epub/20/spec/OPS_2.0.1_draft.htm#Section2.0
  
  This feature file contains tests for EPUBCheck running in `xhtml` mode to check
  single XHTML Content Documents (`.xhtml` files).
  
  Note: Tests related to EPUB XHTML Content Document rules in a full EPUB publication
        are defined in the `content.feature` feature file.

  Background: 
    Given EPUBCheck configured to check an XHTML Content Document
    And EPUBCheck configured to check EPUB 2.0.1 rules
    And test files located at '/epub2/files/content-document-ops/'


  #  2.0 OPS Content Document Vocabularies

  ##  2.1 Introduction

  Scenario: Report a DOCTYPE declaration with an invalid public identifier
    When checking file 'doctype-public-id-error.xhtml'
    Then error HTM-004 is reported
    And no other errors or warnings are reported
  
  Scenario: Report an HTML5 DOCTYPE declaration
    When checking file 'doctype-html5-error.xhtml'
    Then error HTM-004 is reported
    And no other errors or warnings are reported


  ##  2.2 XHTML Modules in the OPS Preferred Vocabulary

  ### Custom Attributes

  Scenario: Report the use of a custom namespaced attribute
    When checking file 'custom-ns-attr-error.xhtml'
    Then error RSC-005 is reported
    And the message contains 'attribute "foo:bar" not allowed here'
    And no other errors or warnings are reported
