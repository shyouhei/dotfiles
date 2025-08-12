#! /opt/homebrew/Library/Homebrew/vendor/portable-ruby/current/bin/ruby

require_relative '../helpers/sbr'

pmset = `pmset -g batt`

case pmset
when /\b(\d+)%; charging; / then
  label = "\u{10088B}" # battery.100percent.bolt
  icon = "#$1%"
when /\b(\d+)%; charged; / then
  icon = { drawing: false }
  label = "\u{1006E8}" # battery.100percent
when /\b(\d+)%; discharging;/ then
  icon = ["#$1%", { drawing: true }]
  case $1.to_i
  when 90 .. 100 then
    label = "\u{1006E8}" # battery.100percent
  when 60 ... 90 then
    label = "\u{100EB8}" # battery.75percent
  when 30 ... 60 then
    label = "\u{100EB6}" # battery.50percent
  when 10 ... 30 then
    label = "\u{1006E9}" # battery.25percent
  else
    label = "\u{1006EA}" # battery.0percent
  end
end



sbr.set icon:, label: