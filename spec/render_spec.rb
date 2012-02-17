require 'spec_helper'

describe SlimAssets do
  it "should have the proper format" do
    RailsApp::Application.assets['link_to.jst.ejs.slim'].to_s.should == "(function() {\n  this.JST || (this.JST = {});\n  this.JST[\"link_to\"] = function(obj){var __p=[],print=function(){__p.push.apply(__p,arguments);};with(obj||{}){__p.push('<h1><div class=\"text\">Render works</div></h1>');}return __p.join('');};\n}).call(this);\n"
  end
end
