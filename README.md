# 🐳 Inception

## 📝 Overview
A containerized WordPress infrastructure project using Docker and Docker Compose. 
This project sets up multiple isolated services including a web server, database, and WordPress in separate containers.

## 🎯 Project Requirements

### Mandatory Services
- **NGINX**: Web server with TLS support
- **WordPress + php-fpm**: Content management system and PHP processor
- **MariaDB**: Database server for WordPress
- Dedicated Docker volumes for WordPress files and database
- Internal Docker network for container communication

### Bonus Services
- **Redis Cache**: Improves WordPress performance by implementing caching
   - Added to enhance website response times and reduce database load
- **Adminer**: Database management tool
   - Provides a lightweight, web-based interface for database administration
- **Prometheus & Grafana**: Monitoring stack
   - Prometheus: Metrics collection and storage
   - Grafana: Visualization and monitoring dashboard
   - Added to provide real-time monitoring and performance insights

## 🔍 Service Overview

| Service | Category | Description |
|---------|----------|-------------|
| NGINX | Core | Web server handling HTTP/HTTPS requests with TLS support, acting as reverse proxy |
| WordPress + PHP-FPM | Core | Content Management System with PHP processing capabilities |
| MariaDB | Core | Relational database server for WordPress data storage |
| Redis | Bonus | In-memory caching system to improve WordPress performance |
| Adminer | Bonus | Lightweight database management interface |
| Prometheus(WIP) | Bonus | Metrics collection and monitoring system |
| Grafana(WIP) | Bonus | Data visualization and monitoring dashboard platform |

## ⚙️ Service Details

### 🚀 Core Services

#### WordPress
- Content Management System
- PHP-FPM configuration for processing PHP requests
- Configured for performance and security

#### NGINX
- Modern web server with TLS/SSL support
- Reverse proxy for WordPress
- Secure configuration with latest security practices

#### MariaDB
- Robust database server
- Configured for WordPress compatibility
- Data persistence through Docker volumes

### ✨ Bonus Services

#### Redis Cache
Redis cache integration improves WordPress performance by:
- Reducing database load
- Improving response times
- Caching frequently accessed data

#### Adminer
Lightweight database management tool offering:
- Web-based interface
- Multiple database system support
- Easy database administration

#### Monitoring Stack (Prometheus & Grafana)(WIP)
Added for comprehensive system monitoring:
- Real-time metrics collection
- Custom dashboards for performance monitoring
- System health visualization
- Alert management capabilities
