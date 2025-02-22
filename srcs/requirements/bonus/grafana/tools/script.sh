#!/bin/bash

# Prometheusデータソースを追加
cat << EOF > /etc/grafana/provisioning/datasources/prometheus.yaml
apiVersion: 1

datasources:
  - name: Prometheus
    type: prometheus
    access: proxy
    url: http://prometheus:9090
    isDefault: true
EOF

# 基本的なダッシュボードを追加
cat << EOF > /etc/grafana/provisioning/dashboards/default.yaml
apiVersion: 1

providers:
  - name: 'Default'
    orgId: 1
    folder: ''
    type: file
    disableDeletion: false
    editable: true
    options:
      path: /etc/grafana/provisioning/dashboards
EOF

# WordPressモニタリングダッシュボードを作成
cat << EOF > /etc/grafana/provisioning/dashboards/wordpress.json
{
  "dashboard": {
    "title": "WordPress Monitoring",
    "panels": [
      {
        "title": "PHP-FPM Active Processes",
        "type": "graph",
        "datasource": "Prometheus",
        "targets": [
          {
            "expr": "php_fpm_processes_active"
          }
        ]
      },
      {
        "title": "Nginx Requests",
        "type": "graph",
        "datasource": "Prometheus",
        "targets": [
          {
            "expr": "nginx_http_requests_total"
          }
        ]
      }
    ]
  }
}
EOF

exec grafana-server \
  --config=/etc/grafana/grafana.ini \
  --homepath=/usr/share/grafana
