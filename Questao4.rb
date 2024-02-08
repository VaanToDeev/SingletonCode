require 'singleton'

class RendererFactory
  def create_texture_renderer
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def create_shadow_renderer
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def create_model_renderer
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

class OpenGLRendererFactory < RendererFactory
  include Singleton

  def create_texture_renderer
    OpenGLTextureRenderer.new
  end

  def create_shadow_renderer
    OpenGLShadowRenderer.new
  end

  def create_model_renderer
    OpenGLModelRenderer.new
  end
end

class DirectXRendererFactory < RendererFactory
  include Singleton

  def create_texture_renderer
    DirectXTextureRenderer.new
  end

  def create_shadow_renderer
    DirectXShadowRenderer.new
  end

  def create_model_renderer
    DirectXModelRenderer.new
  end
end

class TextureRenderer
  def render
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

class ShadowRenderer
  def render
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

class ModelRenderer
  def render
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

class OpenGLTextureRenderer < TextureRenderer
  def render
    puts "Rendering texture with OpenGL"
  end
end

class OpenGLShadowRenderer < ShadowRenderer
  def render
    puts "Rendering shadows with OpenGL"
  end
end

class OpenGLModelRenderer < ModelRenderer
  def render
    puts "Rendering model with OpenGL"
  end
end
class DirectXTextureRenderer < TextureRenderer
  def render
    puts "Rendering texture with DirectX"
  end
end

class DirectXShadowRenderer < ShadowRenderer
  def render
    puts "Rendering shadows with DirectX"
  end
end

class DirectXModelRenderer < ModelRenderer
  def render
    puts "Rendering model with DirectX"
  end
end

class GraphicsClient
  def initialize(renderer_factory)
    @texture_renderer = renderer_factory.create_texture_renderer
    @shadow_renderer = renderer_factory.create_shadow_renderer
    @model_renderer = renderer_factory.create_model_renderer
  end

  def render_graphics
    @texture_renderer.render
    @shadow_renderer.render
    @model_renderer.render
  end
end


opengl_factory = OpenGLRendererFactory.instance
directx_factory = DirectXRendererFactory.instance

opengl_client = GraphicsClient.new(opengl_factory)
opengl_client.render_graphics

puts "\nSwitching Renderer...\n"

directx_client = GraphicsClient.new(directx_factory)
directx_client.render_graphics
