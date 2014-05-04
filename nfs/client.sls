{% from "nfs/defaults.yaml" import rawmap with context %}
{% set datamap = salt['grains.filter_by'](rawmap, merge=salt['pillar.get']('nfs:lookup')) %}

client:
  pkg:
    - installed
    - pkgs:
{% for pkg in datamap.client.pkgs %}
      - {{ pkg }}
{% endfor %}
