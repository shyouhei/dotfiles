#! /opt/homebrew/Library/Homebrew/vendor/portable-ruby/current/bin/ruby

# This wrapper is deliberetely made thin.
def sbr = (::SBR ||= Object.new)

class << sbr
  def script_path(exe)        = '%s/scripts/%s' % [ENV['CONFIG_DIR'], exe]
  def name                    = ENV['NAME']
  def info                    = ENV['INFO']
  def update                  = sketchybar '--update'
  def set(n = name, h)        = sketchybar '--set', n, *join(h)
  def add(t, n = name, *a)    = sketchybar '--add', t, n, *a
  def subscribe(n = name, *a) = sketchybar '--subscribe', n, *a

  def bar=(h)
    sketchybar '--bar', *join(h)
  end

  def default=(h)
    sketchybar '--default', *join(h)
  end

  # all-in-one command
  def []=(n, h)
    raise unless h in { is: [(String|Symbol) => t, *a] }
    self.add t, n, *a
    h[:set]&.then { self.set(n, _1) }
    h[:events]&.then { self.subscribe(n, *_1) }
  end

  private


  def join(h)    = flatten(h).map { "#{_1}=#{_2}" }
  def flatten(h) = h.each_pair.flat_map do |k, v|
    case v
    when Hash then
      flatten(v).flat_map do |kk, vv|
        next [["#{k}.#{kk}", vv]]
      end
    when Array then
      v.flat_map do |vv|
        flatten({k => vv})
      end
    else
      next [[k, v]]
    end
  end

  def sketchybar(*argv, **argh) = Kernel.system(
    '/opt/homebrew/bin/sketchybar',
    *argv.map(&:to_s).tap{p _1}
  )
end
__END__
  def bar(**argh)         = enq '--bar', **argh
  def default(**argh)     = enq '--default', **argh
  def update              = flush_with '--update'
  def set(n=name, **argh) = flush_with '--set', n, **argh

  def item(where, what, set: nil, subscribe: nil)
    enq '--add', 'item', what, where
    enq '--set', what, **set if set
    enq '--subscribe', what, *subscribe if subscribe
    @b&.push what
  end

  def alias(where, what, set: nil, subscribe: nil)
    enq '--add', 'alias', what, where
    enq '--set', what, **set if set
    enq '--subscribe', what, *subscribe if subscribe
    @b&.push what
  end

  def bracket(what, set: nil)
    @b ||= []
    yield
  ensure
    enq '--add', 'bracket', what, *@b
    enq '--set', what, **set if set
    @b = nil
  end

  private

  def flatten(hash) = hash.each_pair.flat_map do |k, v|
    case v
    when Hash then
      flatten(v).flat_map do |kk, vv|
        next [["#{k}.#{kk}", vv]]
      end
    when Array then
      v.flat_map do |vv|
        flatten({k => vv})
      end
    else
      next [[k, v]]
    end
  end

  def enq(*argv, **argh) = (@q ||= []) << [
    *argv.map(&:to_s),
    *(flatten(argh).map {"#{_1}=#{_2}"})
  ]

  def flush 
  def flush_with(*argv, **argh)
    enq(*argv, **argh)
    flush
  end
end