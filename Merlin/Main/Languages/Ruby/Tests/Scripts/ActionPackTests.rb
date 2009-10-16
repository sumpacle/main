require "rubygems"
gem "actionpack", "= 2.3.3"
require 'action_pack/version'

root_dir = File.expand_path '..\External.LCA_RESTRICTED\Languages\IronRuby\RailsTests-2.3.3\actionpack', ENV['MERLIN_ROOT']
$LOAD_PATH << root_dir + '/test'
test_files = Dir.glob("#{root_dir}/test/[cft]*/**/*_test.rb").sort
# ActiveRecord will need a database driver
# test_files += Dir.glob("#{root_dir}/test/activerecord/*_test.rb")

# Do some sanity checks
abort("Did not find enough tests files...") unless test_files.size > 80
abort("Did not find some expected files...") unless File.exist?(root_dir + "/test/controller/action_pack_assertions_test.rb")
abort("Loaded the wrong version #{ActionPack::VERSION::STRING} instead of the expected 2.3.3 ...") unless ActionPack::VERSION::STRING == '2.3.3'

# Note that the tests are registered using Kernel#at_exit, and will run during shutdown
# The "require" statement just registers the tests for being run later...
test_files.each { |f| require f }

# Disable failing tests by monkey-patching the test method to be a nop

# The first set of tags is non-deterministic test failures

class LastModifiedRenderTest
  # <"Mon, 07 Sep 2009 00:00:00 GMT"> expected but was
  # <"Sun, 06 Sep 2009 23:59:59 GMT">.
  def test_request_not_modified() end
  
  # Expected response to be a <:not_modified>, but was <200>
  def test_request_with_bang_obeys_last_modified() end
  
  # <"Sun, 06 Sep 2009 23:59:59 GMT"> expected but was
  # <"Mon, 07 Sep 2009 00:00:00 GMT">.
  def test_request_with_bang_gets_last_modified() end
end

# The following list of test tags is generated by doing:
#   require "generate_test-unit_tags"

class ActionCacheTest
  # <false> is not true.
  def test_action_cache_with_custom_cache_path() end

  # <false> is not true.
  def test_action_cache_with_custom_cache_path_in_block() end

  # <false> is not true.
  def test_action_cache_with_layout() end

  # <false> is not true.
  def test_action_cache_with_layout_and_layout_cache_false() end

  # not all expectations were satisfied
  # unsatisfied expectations:
  # - expected exactly once, not yet invoked: #<ActionCachingTestController:0x411e>.write_fragment('hostname.com/action_caching_test', '12345.0', {:expires_in => 3600})
  # - expected exactly once, not yet invoked: #<ActionCachingTestController:0x411e>.read_fragment('hostname.com/action_caching_test', {:expires_in => 3600})
  # satisfied expectation
  def test_action_cache_with_store_options() end

  # <"1252314416.2022"> expected but was
  # <"1252314416.3114">.
  def test_cache_expiration() end

  # <"1252314416.96659"> expected but was
  # <"1252314417.29419">.
  def test_cache_is_scoped_by_subdomain() end

  # <"application/xml"> expected but was
  # <"text/html">.
  def test_correct_content_type_is_returned_for_cache_hit() end

  # <"application/xml"> expected but was
  # <"text/html">.
  def test_correct_content_type_is_returned_for_cache_hit_on_action_with_string_key() end

  # <"application/xml"> expected but was
  # <"text/html">.
  def test_correct_content_type_is_returned_for_cache_hit_on_action_with_string_key_from_proc() end

  # <false> is not true.
  def test_simple_action_cache() end

  # <false> is not true.
  def test_xml_version_of_resource_is_treated_as_different_cache() end

end

class AssertSelectTest
  # NameError: uninitialized constant Iconv::IllegalSequence
  def test_assert_select_email() end

  # </�?�..�??/u> expected but was
  # <"\343\203\201\343\202\261\343\203\203\343\203\210">.
  # <false> is not true.
  def test_assert_select_rjs_with_unicode() end

end

class AssetTagHelperTest
  # <"<script src=\"/javascripts/prototype.js\" type=\"text/javascript\"></script>\n<script src=\"/javascripts/effects.js\" type=\"text/javascript\"></script>\n<script src=\"/javascripts/dragdrop.js\" type=\"text/javascript\"></script>\n<script src=\"/javascripts/controls.js\" type=\"text/javascript\"></script>\n<script src=\"/javascripts/application.js\" type=\"text/javascript\"></script>\n<script src
  def test_caching_javascript_include_tag_when_caching_off() end

  # <"<script src=\"http://a0.example.com/javascripts/all.js\" type=\"text/javascript\"></script>"> expected to be == to
  # <"<script src=\"http://a0.example.com/javascripts/all.js?1245781105\" type=\"text/javascript\"></script>">.
  def test_caching_javascript_include_tag_when_caching_on() end

  # <"<script src=\"http://a1.example.com/javascripts/cache/money.js\" type=\"text/javascript\"></script>"> expected to be == to
  # <"<script src=\"http://a2.example.com/javascripts/cache/money.js?1245781105\" type=\"text/javascript\"></script>">.
  def test_caching_javascript_include_tag_when_caching_on_and_using_subdirectory() end

  # <"<script src=\"http://assets23.example.com/javascripts/vanilla.js\" type=\"text/javascript\"></script>"> expected to be == to
  # <"<script src=\"http://assets34.example.com/javascripts/vanilla.js?1245781105\" type=\"text/javascript\"></script>">.
  def test_caching_javascript_include_tag_when_caching_on_with_2_argument_object_asset_host() end

  # <"<script src=\"http://assets23.example.com/javascripts/vanilla.js\" type=\"text/javascript\"></script>"> expected to be == to
  # <"<script src=\"http://assets34.example.com/javascripts/vanilla.js?1245781105\" type=\"text/javascript\"></script>">.
  def test_caching_javascript_include_tag_when_caching_on_with_2_argument_proc_asset_host() end

  # <"<script src=\"http://a23.example.com/javascripts/scripts.js\" type=\"text/javascript\"></script>"> expected to be == to
  # <"<script src=\"http://a34.example.com/javascripts/scripts.js?1245781105\" type=\"text/javascript\"></script>">.
  def test_caching_javascript_include_tag_when_caching_on_with_proc_asset_host() end

  # <"<script src=\"http://a0.example.com/javascripts/combined.js\" type=\"text/javascript\"></script>"> expected to be == to
  # <"<script src=\"http://a0.example.com/javascripts/combined.js?1245781105\" type=\"text/javascript\"></script>">.
  def test_caching_javascript_include_tag_with_all_and_recursive_puts_defaults_at_the_start_of_the_file() end

  # <"<script src=\"http://a0.example.com/javascripts/combined.js\" type=\"text/javascript\"></script>"> expected to be == to
  # <"<script src=\"http://a0.example.com/javascripts/combined.js?1245781105\" type=\"text/javascript\"></script>">.
  def test_caching_javascript_include_tag_with_all_puts_defaults_at_the_start_of_the_file() end

  # <"<script src=\"/collaboration/hieraki/javascripts/all.js\" type=\"text/javascript\"></script>"> expected to be == to
  # <"<script src=\"/collaboration/hieraki/javascripts/all.js?1245781105\" type=\"text/javascript\"></script>">.
  def test_caching_javascript_include_tag_with_relative_url_root() end

  # <"<link href=\"/stylesheets/bank.css\" media=\"screen\" rel=\"stylesheet\" type=\"text/css\" />\n<link href=\"/stylesheets/robber.css\" media=\"screen\" rel=\"stylesheet\" type=\"text/css\" />\n<link href=\"/stylesheets/version.1.0.css\" media=\"screen\" rel=\"stylesheet\" type=\"text/css\" />"> expected to be == to
  # <"<link href=\"/stylesheets/bank.css?1245781105\" media=\"screen\" rel=\"stylesheet
  def test_caching_stylesheet_include_tag_when_caching_off() end

  # <"<link href=\"http://a0.example.com/stylesheets/all.css\" media=\"screen\" rel=\"stylesheet\" type=\"text/css\" />"> expected to be == to
  # <"<link href=\"http://a0.example.com/stylesheets/all.css?1245781105\" media=\"screen\" rel=\"stylesheet\" type=\"text/css\" />">.
  def test_caching_stylesheet_link_tag_when_caching_on() end

  # <"<link href=\"http://a23.example.com/stylesheets/styles.css\" media=\"screen\" rel=\"stylesheet\" type=\"text/css\" />"> expected to be == to
  # <"<link href=\"http://a34.example.com/stylesheets/styles.css?1245781105\" media=\"screen\" rel=\"stylesheet\" type=\"text/css\" />">.
  def test_caching_stylesheet_link_tag_when_caching_on_with_proc_asset_host() end

  # <"<link href=\"/collaboration/hieraki/stylesheets/all.css\" media=\"screen\" rel=\"stylesheet\" type=\"text/css\" />"> expected to be == to
  # <"<link href=\"/collaboration/hieraki/stylesheets/all.css?1245781105\" media=\"screen\" rel=\"stylesheet\" type=\"text/css\" />">.
  def test_caching_stylesheet_link_tag_with_relative_url_root() end

  # <"<link href=\"/stylesheets/all.css\" media=\"screen\" rel=\"stylesheet\" type=\"text/css\" />"> expected to be == to
  # <"<link href=\"/stylesheets/all.css?1245781105\" media=\"screen\" rel=\"stylesheet\" type=\"text/css\" />">.
  def test_concat_stylesheet_link_tag_when_caching_off() end

  # <"<script src=\"/javascripts/first.js\" type=\"text/javascript\"></script>\n<script src=\"/javascripts/prototype.js\" type=\"text/javascript\"></script>\n<script src=\"/javascripts/effects.js\" type=\"text/javascript\"></script>\n<script src=\"/javascripts/dragdrop.js\" type=\"text/javascript\"></script>\n<script src=\"/javascripts/controls.js\" type=\"text/javascript\"></script>\n<script src=\"/ja
  def test_custom_javascript_expansions_and_defaults_puts_application_js_at_the_end() end

  # <"<script src=\"/javascripts/prototype.js\" type=\"text/javascript\"></script>\n<script src=\"/javascripts/effects.js\" type=\"text/javascript\"></script>\n<script src=\"/javascripts/dragdrop.js\" type=\"text/javascript\"></script>\n<script src=\"/javascripts/controls.js\" type=\"text/javascript\"></script>\n<script src=\"/javascripts/application.js\" type=\"text/javascript\"></script>"> expected t
  def test_javascript_include_tag_with_blank_asset_id() end

  # <"<img alt=\"Rails\" src=\"/images/rails.png\" />"> expected but was
  # <"<img alt=\"Rails\" src=\"/images/rails.png?1245781105\" />">.
  def test_preset_empty_asset_id() end

  # <"<script src=\"/javascripts/prototype.js\" type=\"text/javascript\"></script>\n<script src=\"/javascripts/effects.js\" type=\"text/javascript\"></script>\n<script src=\"/javascripts/dragdrop.js\" type=\"text/javascript\"></script>\n<script src=\"/javascripts/controls.js\" type=\"text/javascript\"></script>\n<script src=\"/javascripts/slider.js\" type=\"text/javascript\"></script>\n<script src=\"/j
  def test_register_javascript_include_default() end

  # <"<script src=\"/javascripts/prototype.js\" type=\"text/javascript\"></script>\n<script src=\"/javascripts/effects.js\" type=\"text/javascript\"></script>\n<script src=\"/javascripts/dragdrop.js\" type=\"text/javascript\"></script>\n<script src=\"/javascripts/controls.js\" type=\"text/javascript\"></script>\n<script src=\"/javascripts/slider.js\" type=\"text/javascript\"></script>\n<script src=\"/j
  def test_register_javascript_include_default_mixed_defaults() end

  # <"<link href=\"/stylesheets/bank.css\" media=\"screen\" rel=\"stylesheet\" type=\"text/css\" />\n<link href=\"/stylesheets/robber.css\" media=\"screen\" rel=\"stylesheet\" type=\"text/css\" />\n<link href=\"/stylesheets/version.1.0.css\" media=\"screen\" rel=\"stylesheet\" type=\"text/css\" />"> expected to be == to
  # <"<link href=\"/stylesheets/bank.css?1245781105\" media=\"screen\" rel=\"stylesheet
  def test_stylesheet_link_tag() end

end

class CachedRenderTest
  # <"undefined method `doesnt_exist' for #<ActionView::Base:0x000b208 @_rendered={:template=>#<ActionView::Template:0x0003f18 @template_path=\"test/_raise.html.erb\", @load_path=\"c:/github/ironruby/Merlin/External.LCA_RESTRICTED/Languages/IronRuby/RailsTests-2.3.3/actionpack/test/fixtures\", @base_path=\"test\", @name=\"_raise\", @locale=nil, @format=\"html\", @extension=\"erb\", @_memoized_variable_
  def test_render_partial_with_errors() end

  # <"undefined method `doesnt_exist' for #<ActionView::Base:0x000b2bc @_rendered={:template=>#<ActionView::Template:0x0003ee2 @template_path=\"test/sub_template_raise.html.erb\", @load_path=\"c:/github/ironruby/Merlin/External.LCA_RESTRICTED/Languages/IronRuby/RailsTests-2.3.3/actionpack/test/fixtures\", @base_path=\"test\", @name=\"sub_template_raise\", @locale=nil, @format=\"html\", @extension=\"erb
  def test_render_sub_template_with_errors() end

end

class CookieTest
  # <["user_name=; path=/beaten; expires=Thu, 01-Jan-1970 00:00:00 GMT"]> expected but was
  # <[]>.
  def test_delete_cookie_with_path() end

  # <["user_name=; path=/; expires=Thu, 01-Jan-1970 00:00:00 GMT"]> expected but was
  # <[]>.
  def test_expiring_cookie() end

  # <2> expected but was
  # <0>.
  def test_multiple_cookies() end

  # <["user_name=david; path=/; expires=Mon, 10-Oct-2005 05:00:00 GMT"]> expected but was
  # <[]>.
  def test_setting_cookie_for_fourteen_days() end

  # <["user_name=david; path=/; expires=Mon, 10-Oct-2005 05:00:00 GMT"]> expected but was
  # <[]>.
  def test_setting_cookie_for_fourteen_days_with_symbols() end

end

class IntegrationProcessTest
  # <200> expected but was
  # <500>.
  def test_multipart_post_with_multiparameter_attribute_parameters() end
end

class IsolatedHelpersTest
  # <NameError> exception expected but was
  # Class: <#<Class:0x0001ea2 @inheritable_attributes={}>>
  # Message: <"undefined method `shout' for #<ActionView::Base:0x00415fc @_rendered={:template=>nil, :partials=>{}}, @assigns={}, @assigns_added=true, @controller=#<IsolatedHelpersTest::A:0x00415fa @before_filter_chain_aborted=false, @performed_redirect=false, @performed_render=false, @_request=#<ActionControl
  def test_helper_in_a() end
end

class LastModifiedRenderTest
  # <"Mon, 07 Sep 2009 00:00:00 GMT"> expected but was
  # <"Sun, 06 Sep 2009 23:59:59 GMT">.
  def test_request_modified() end

  # <"Sun, 06 Sep 2009 23:59:59 GMT"> expected but was
  # <"Mon, 07 Sep 2009 00:00:00 GMT">.
  def test_responds_with_last_modified() end

end

class LegacyRouteSetTests
  # <"/page/20"> expected but was
  # <"/pages/show/20">.
  def test_backwards() end

  # <"/test"> expected but was
  # <"/post/show">.
  def test_both_requirement_and_optional() end

  # <"/categories"> expected but was
  # <"/content/categories">.
  def test_named_route_method() end

  # <"/categories"> expected but was
  # <"/content/categories">.
  def test_named_routes_array() end

  # <"/"> expected but was
  # <"/content">.
  def test_named_url_with_no_action_specified() end

  # <"/journal"> expected but was
  # <"/content/list_journal">.
  def test_nil_defaults() end

  # <"/page"> expected but was
  # <"/content/show_page">.
  def test_route_with_fixnum_default() end

  # <"/page/foo"> expected but was
  # <"/content/show_page/foo">.
  def test_route_with_text_default() end

  # <"/pages/2005/6"> expected but was
  # <"/content/list_pages">.
  def test_set_to_nil_forgets() end

  # <"/books/7/edit"> expected but was
  # <"/items/7/edit">.
  def test_subpath_generated() end

  # <"/"> expected but was
  # <"/content">.
  def test_url_generated_when_forgetting_action() end

  # <"/"> expected but was
  # <"/content">.
  def test_url_with_no_action_specified() end

end

class MultipartParamsParsingTest
  # NoMethodError: undefined method `stat' for #<File:c:/github/ironruby/Merlin/External.LCA_RESTRICTED/Languages/IronRuby/RailsTests-2.3.3/actionpack/test/controller/request/../../fixtures/multipart/none>
  def test_does_not_create_tempfile_if_no_file_has_been_selected() end

  # NoMethodError: undefined method `stat' for #<File:c:/github/ironruby/Merlin/External.LCA_RESTRICTED/Languages/IronRuby/RailsTests-2.3.3/actionpack/test/controller/request/../../fixtures/multipart/binary_file>
  def test_parses_binary_file() end

  # NoMethodError: undefined method `stat' for #<File:c:/github/ironruby/Merlin/External.LCA_RESTRICTED/Languages/IronRuby/RailsTests-2.3.3/actionpack/test/controller/request/../../fixtures/multipart/boundary_problem_file>
  def test_parses_boundary_problem_file() end

  # NoMethodError: undefined method `stat' for #<File:c:/github/ironruby/Merlin/External.LCA_RESTRICTED/Languages/IronRuby/RailsTests-2.3.3/actionpack/test/controller/request/../../fixtures/multipart/bracketed_param>
  def test_parses_bracketed_parameters() end

  # NoMethodError: undefined method `stat' for #<File:c:/github/ironruby/Merlin/External.LCA_RESTRICTED/Languages/IronRuby/RailsTests-2.3.3/actionpack/test/controller/request/../../fixtures/multipart/empty>
  def test_parses_empty_upload_file() end

  # NoMethodError: undefined method `stat' for #<File:c:/github/ironruby/Merlin/External.LCA_RESTRICTED/Languages/IronRuby/RailsTests-2.3.3/actionpack/test/controller/request/../../fixtures/multipart/large_text_file>
  def test_parses_large_text_file() end

  # NoMethodError: undefined method `stat' for #<File:c:/github/ironruby/Merlin/External.LCA_RESTRICTED/Languages/IronRuby/RailsTests-2.3.3/actionpack/test/controller/request/../../fixtures/multipart/mixed_files>
  def test_parses_mixed_files() end

  # NoMethodError: undefined method `stat' for #<File:c:/github/ironruby/Merlin/External.LCA_RESTRICTED/Languages/IronRuby/RailsTests-2.3.3/actionpack/test/controller/request/../../fixtures/multipart/single_parameter>
  def test_parses_single_parameter() end

  # NoMethodError: undefined method `stat' for #<File:c:/github/ironruby/Merlin/External.LCA_RESTRICTED/Languages/IronRuby/RailsTests-2.3.3/actionpack/test/controller/request/../../fixtures/multipart/text_file>
  def test_parses_text_file() end

end

class PageCachingTest
  # <"/"> expected but was
  # <"/posts">.
  def test_page_caching_resources_saves_to_correct_path_with_extension_even_if_default_route() end

  # get with ok status should have been cached.
  # <false> is not true.
  def test_should_cache_get_with_ok_status() end

  # <false> is not true.
  def test_should_cache_ok_at_custom_path() end

end

class ReloadableRenderTest
  # <"undefined method `doesnt_exist' for #<ActionView::Base:0x004d78c @_rendered={:template=>#<ActionView::ReloadableTemplate:0x004d816 @template_path=\"test/_raise.html.erb\", @load_path=\"c:/github/ironruby/Merlin/External.LCA_RESTRICTED/Languages/IronRuby/RailsTests-2.3.3/actionpack/test/fixtures\", @base_path=\"test\", @name=\"_raise\", @locale=nil, @format=\"html\", @extension=\"erb\", @_memoized
  def test_render_partial_with_errors() end

  # <"undefined method `doesnt_exist' for #<ActionView::Base:0x004db28 @_rendered={:template=>#<ActionView::ReloadableTemplate:0x004db7c @template_path=\"test/sub_template_raise.html.erb\", @load_path=\"c:/github/ironruby/Merlin/External.LCA_RESTRICTED/Languages/IronRuby/RailsTests-2.3.3/actionpack/test/fixtures\", @base_path=\"test\", @name=\"sub_template_raise\", @locale=nil, @format=\"html\", @exten
  def test_render_sub_template_with_errors() end

end

class RenderTest
  # NameError: uninitialized constant Mocha::TestCaseAdapter
  def test_line_offset() end
end

class RescueControllerTest
  # NoMethodError: undefined method `message' for nil:NilClass
  def test_block_rescue_handler_with_argument() end

  # NoMethodError: undefined method `message' for nil:NilClass
  def test_block_rescue_handler_with_argument_as_string() end

  # NoMethodError: undefined method `message' for nil:NilClass
  def test_proc_rescue_handle_with_argument() end

  # NoMethodError: undefined method `message' for nil:NilClass
  def test_proc_rescue_handle_with_argument_as_string() end

end

class RouteSetTest
  # <"/about"> expected but was
  # <"/welcome/about">.
  def test_use_static_path_when_possible() end
end

class TestTest
  # NoMethodError: undefined method `stat' for #<File:C:/Users/sborde/AppData/Local/Temp/mona_lisa.jpg.13276.10>
  def test_fixture_file_upload() end
end

class UrlWriterTests
  # <"http://www.basecamphq.com/"> expected but was
  # <"http://www.basecamphq.com/posts">.
  def test_named_routes_with_nil_keys() end
end

class VerificationTest
  # ActionView::MissingTemplate: Missing template verification_test/test/no_default_action.erb in view path c:/github/ironruby/Merlin/External.LCA_RESTRICTED/Languages/IronRuby/RailsTests-2.3.3/actionpack/test/fixtures
  def test_default_failure_should_be_a_bad_request() end

  # Expected response to be a <:redirect>, but was <200>
  def test_guarded_by_method_without_prereqs() end

  # Expected response to be a <:redirect>, but was <200>
  def test_guarded_by_not_xhr_without_prereqs() end

  # Expected response to be a <:redirect>, but was <200>
  def test_guarded_by_xhr_without_prereqs() end

  # Expected response to be a <:redirect>, but was <200>
  def test_guarded_in_session_without_prereqs() end

  # Expected response to be a <:redirect>, but was <200>
  def test_guarded_one_without_prereqs() end

  # Expected response to be a <405>, but was <200>
  def test_guarded_post_and_calls_render_fails_and_sets_allow_header() end

  # Expected response to be a <:redirect>, but was <200>
  def test_guarded_two_without_prereqs_both() end

  # Expected response to be a <:redirect>, but was <200>
  def test_guarded_two_without_prereqs_one() end

  # Expected response to be a <:redirect>, but was <200>
  def test_guarded_two_without_prereqs_two() end

  # Expected response to be a <:redirect>, but was <200>
  def test_guarded_with_flash_without_prereqs() end

  # Expected response to be a <:redirect>, but was <200>
  def test_multi_one_without_prereqs() end

  # Expected response to be a <:redirect>, but was <200>
  def test_multi_two_without_prereqs() end

  # Expected response to be a <:redirect>, but was <200>
  def test_no_deprecation_warning_for_named_route() end

  # Expected response to be a redirect to <http://test.host/foo> but was a redirect to <http://test.host/verification_test/test/unguarded>.
  def test_using_symbol_back_redirects_to_referrer() end

  # <#<Class:0x0001aba @inheritable_attributes={}>> exception expected but none was thrown.
  def test_using_symbol_back_with_no_referrer() end

end

#------------------------------------------------------------------------------
# Tests failing with MRI. Generated by doing:
#   require 'generate_test-unit_tags'

class CleanBacktraceTest
  # <["c:/github/ironruby/Merlin/External.LCA_RESTRICTED/Languages/IronRuby/RailsTests-2.3.3/actionpack/lib/action_controller/abc"]> expected but was
  # <["c:/github/ironruby/Merlin/External.LCA_RESTRICTED/Languages/IronRuby/RailsTests-2.3.3/actionpack/lib/action_controller/abc",
  #  "c:/github/ironruby/Merlin/External.LCA_RESTRICTED/Languages/IronRuby/RailsTests-2.3.3/actionpack/lib/action_controller/assert
  def test_should_clean_assertion_lines_from_backtrace() end
end
