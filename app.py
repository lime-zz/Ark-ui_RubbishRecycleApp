from flask import Flask, request, jsonify
from flask_cors import CORS
import pymysql
import traceback
import json
from datetime import datetime, timedelta
app = Flask(__name__)
CORS(app)  # 允许跨域请求

# 数据库连接配置
def get_db_connection():
    return pymysql.connect(
        host='127.0.0.1',
        user='root',
        password='12345678',
        database='rubbish',
        charset='utf8',
       
       
    )

# 登录接口 (POST /api/login)
@app.route('/api/login', methods=['POST'])
def login():
    try:
        raw_data = request.data.decode('utf-8')
        print("接收到的原始请求数据:", raw_data)
        if not raw_data or raw_data.strip() == '':
            print("请求体为空或无效")
            return jsonify({'code': 1, 'message': '请求体为空'}), 400   
        try:
            data = json.loads(raw_data)
            print("成功解析的JSON:", data)
        except json.JSONDecodeError as e:
            print(f"JSON解析错误: {str(e)}\n{''.join(traceback.format_exc())}")
            return jsonify({
                'code': 400,
                'message': f'请求格式错误: {str(e)}'
            }), 400
        account = data.get('account')
        password = data.get('password')

        if not account or not password:
            return jsonify({'code': 1, 'message': '用户名和密码不能为空'}), 400

        conn = get_db_connection()
        cursor = conn.cursor()
        
        try:
            cursor.execute("SELECT * FROM users WHERE username = %s", (account,))
            user = cursor.fetchone()
        except pymysql.Error as e:
            print(f"数据库查询出错: {str(e)}")
            return jsonify({'code': 500, 'message': '数据库错误'}), 500

        if not user:
            cursor.close()
            conn.close()
            print(f"用户不存在: {account}")
            return jsonify({'code': 1, 'message': '用户不存在'}), 404

        if user[2] != password:
            cursor.close()
            conn.close()
            print(f"密码错误: {account}")
            return jsonify({'code': 2, 'message': '密码错误'}), 401

        cursor.close()
        conn.close()
        print(f"登录成功: {account}")
        return jsonify({'code': 0, 'message': '登录成功'})
    except Exception as e:
        print(f"登录处理失败: {str(e)}\n{''.join(traceback.format_exc())}")
        return jsonify({'code': 500, 'message': '服务器内部错误'}), 500

# 注册接口 (POST /api/register)
@app.route('/api/register', methods=['POST'])
def register():
    try:
        raw_data = request.data.decode('utf-8')
        print("接收到的原始请求数据:", raw_data)
        
        if not raw_data or raw_data.strip() == '':
            print("请求体为空或无效")
            return jsonify({'code': 1, 'message': '请求体为空'}), 400
            
        try:
            data = json.loads(raw_data)
            print("成功解析的JSON:", data)
        except json.JSONDecodeError as e:
            print(f"JSON解析错误: {str(e)}\n{''.join(traceback.format_exc())}")
            return jsonify({
                'code': 400,
                'message': f'请求格式错误: {str(e)}'
            }), 400
        
        account = data.get('account')
        password = data.get('password')

        if not account or not password:
            return jsonify({'code': 1, 'message': '用户名和密码不能为空'}), 400

        conn = get_db_connection()
        cursor = conn.cursor()
        
        try:
            cursor.execute("SELECT * FROM users WHERE username = %s", (account,))
            existing_user = cursor.fetchone()
        except pymysql.Error as e:
            print(f"数据库查询出错: {str(e)}")
            return jsonify({'code': 500, 'message': '数据库错误'}), 500

        if existing_user:
            cursor.close()
            conn.close()
            print(f"用户已存在: {account}")
            return jsonify({'code': 1, 'message': '用户已存在'}), 409

        try:
            cursor.execute(
                "INSERT INTO users (username, password) VALUES (%s, %s)",
                (account, password)
            )
            conn.commit()
        except pymysql.Error as e:
            print(f"数据库插入出错: {str(e)}")
            return jsonify({'code': 500, 'message': '数据库错误'}), 500

        cursor.close()
        conn.close()
        print(f"注册成功: {account}")
        return jsonify({'code': 0, 'message': '注册成功'})
    except Exception as e:
        print(f"注册处理失败: {str(e)}\n{''.join(traceback.format_exc())}")
        return jsonify({'code': 500, 'message': '服务器内部错误'}), 500


# 商品搜索接口
@app.route('/api/search', methods=['GET'])
def search_products():
    try:
        keyword = request.args.get('keyword', '').strip()
        
        if not keyword:
            return jsonify({
                'code': 400,
                'message': '请输入搜索关键词',
                'data': []
            }), 400
        
        conn = get_db_connection()
        cursor = conn.cursor()
        
        cursor.execute(
            "SELECT id, name,created_at FROM products WHERE name LIKE %s",
            (f'%{keyword}%',)
        )
        
        products = []
        for row in cursor.fetchall():
            products.append({
                'id': row[0],
                'name': row[1],
                'created_at': row[2].strftime('%Y-%m-%d %H:%M:%S') if row[2] else ''
            })
        
        cursor.close()
        conn.close()
        
        return jsonify({
            'code': 0,
            'message': f'找到 {len(products)} 个匹配商品',
            'data': products
        })
    except Exception as e:
        print("商品搜索失败:", e)
        return jsonify({
            'code': 500,
            'message': '商品搜索失败',
            'data': []
        }), 500


 # 获取商品列表（支持按日期筛选）
@app.route('/api/exchange/items', methods=['GET'])
def get_exchange_items():
    try:
        conn = get_db_connection()
        cursor = conn.cursor()
        
        date = request.args.get('date')
        if date:
            cursor.execute(
                "SELECT id, name, price, original_price, exchange_count, total_count, activity_date, status FROM items WHERE activity_date = %s",
                (date,)
            )
        else:
            cursor.execute("SELECT id, name, price, original_price, exchange_count, total_count, activity_date, status FROM items")
        
        data = cursor.fetchall()
        items = []
        for row in data:
            progress = round((row[4] / row[5]) * 100) if row[5] != 0 else 0
            items.append({
                'id': row[0],
                'title': row[1],
                'points': row[2],
                'originalPoints': row[3],
                'exchangedPeople': row[4],
                'totalCount': row[5],
                'activityDate': row[6],
               'status': row[7],
                'progress': progress,
                'buttonText': '马上兑' if row[7] == '进行中' else '未开始',
                'buttonEnabled': row[7] == '进行中'
            })
        
        cursor.close()
        conn.close()
        return jsonify({'code': 0, 'data': items})
    except Exception as e:
        print("获取商品失败:", e)
        return jsonify({'code': 500, 'message': '获取商品失败'}), 500

# 处理兑换请求（点击“马上兑”时调用）
@app.route('/api/exchange', methods=['POST'])
def exchange_item():
    try:
        data = request.get_json()
        item_id = data.get('itemId')
        user_id = data.get('userId')
        
        if not item_id or not user_id:
            return jsonify({'code': 400, 'message': '商品ID和用户ID不能为空'}), 400
        
        if not isinstance(user_id, int):
            return jsonify({
                'code': 400,
                'message': 'Invalid user_id: must be an integer'
            }), 400
        
        conn = get_db_connection()
        cursor = conn.cursor()
        
        cursor.execute("SELECT status, total_count, exchange_count FROM items WHERE id = %s", (item_id,))
        item = cursor.fetchone()
        if not item:
            return jsonify({'code': 404, 'message': '商品不存在'}), 404
        if item[0]!= '进行中':
            return jsonify({'code': 400, 'message': '活动未开始或已结束'}), 400
        if item[1] <= item[2]:
            return jsonify({'code': 400, 'message': '商品已兑完'}), 400
        
        cursor.execute(
            "UPDATE items SET exchange_count = exchange_count + 1 WHERE id = %s",
            (item_id,)
        )
        cursor.execute(
            "INSERT INTO records (user_id, item_id, exchange_time) VALUES (%s, %s, NOW())",
            (user_id, item_id)
        )
        
        conn.commit()
        cursor.close()
        conn.close()
        return jsonify({'code': 0, 'message': '兑换成功'})
    except Exception as e:
        print("兑换失败:", e)
        return jsonify({'code': 500, 'message': '兑换失败'}), 500
       

# 获取用户签到信息
@app.route('/api/user/<int:user_id>/check-info', methods=['GET'])
def get_check_info(user_id):
    try:
        conn = get_db_connection()
        cursor = conn.cursor()
        today = datetime.now().date()
        current_month = today.month
        current_year = today.year
        
        cursor.execute("""
            SELECT DAY(check_in_date) AS day FROM check_ins 
            WHERE user_id = %s 
              AND YEAR(check_in_date) = %s 
              AND MONTH(check_in_date) = %s
        """, (user_id, current_year, current_month))
        monthly_checks = [item[0] for item in cursor.fetchall()]
        
        cursor.execute("""
            SELECT 1 FROM check_ins 
            WHERE user_id = %s AND check_in_date = %s
        """, (user_id, today))
        is_signed_today = cursor.fetchone() is not None
        
        consecutive_days = 0
        if is_signed_today:
            consecutive_days = 1
            for i in range(1, 365):
                check_date = today - timedelta(days=i)
                cursor.execute("""
                    SELECT 1 FROM check_ins 
                    WHERE user_id = %s AND check_in_date = %s
                """, (user_id, check_date))
                if cursor.fetchone():
                    consecutive_days += 1
                else:
                    break
        
        conn.close()
        return jsonify({
            'code': 0,
            'message': 'success',
            'data': {
                'monthly_checks': monthly_checks,
                'is_signed_today': is_signed_today,
                'consecutive_days': consecutive_days
            }
        })
    except Exception as e:
        print(f"获取签到信息失败: {e}")
        return jsonify({'code': 500, 'message': '服务器错误', 'data': None})

# 执行签到
@app.route('/api/user/<int:user_id>/check-in', methods=['POST'])
def do_check_in(user_id):
    try:
        conn = get_db_connection()
        cursor = conn.cursor()
        today = datetime.now().date()
        
        cursor.execute("""
            SELECT 1 FROM check_ins 
            WHERE user_id = %s AND check_in_date = %s
        """, (user_id, today))
        if cursor.fetchone():
            conn.close()
            return jsonify({
                'code': 1,
                'message': '今日已签到',
                'data': None
            })
        
        cursor.execute("""
            INSERT INTO check_ins (user_id, check_in_date) 
            VALUES (%s, %s)
        """, (user_id, today))
        conn.commit()
        conn.close()
        
        return get_check_info(user_id)
    except Exception as e:
        print(f"签到失败: {e}")
        return jsonify({'code': 500, 'message': '服务器错误', 'data': None})

# 添加购物车商品接口 (POST /api/cart/add)
@app.route('/api/cart/add', methods=['POST'])
def add_to_cart():
    try:
        data = request.get_json()
        image_key = data.get('image_key')
        product_name = data.get('product_name')
        price = float(data.get('price'))

        if not image_key:
            return jsonify({'code': 400, 'message': '商品图片标识不能为空'}), 400

        conn = get_db_connection()
        cursor = conn.cursor()

        cursor.execute("SELECT * FROM cart_items WHERE image_key = %s", (image_key,))
        existing_item = cursor.fetchone()

        if existing_item:
            new_quantity = existing_item[4] + 1
            new_total_price = new_quantity * price
            cursor.execute(
                "UPDATE cart_items SET quantity = %s, total_price = %s WHERE image_key = %s",
                (new_quantity, new_total_price, image_key)
            )
        else:
            total_price = price * 1
            cursor.execute("INSERT INTO cart_items (image_key, product_name, price, quantity, total_price) VALUES (%s, %s, %s, %s, %s)", 
                         (image_key, product_name, price, 1, total_price))

        conn.commit()
        cursor.close()
        conn.close()

        return jsonify({'code': 0, 'message': '购物车更新成功'})
    except Exception as e:
        print("添加到购物车失败:", e)
        return jsonify({'code': 500, 'message': '服务器内部错误'}), 500

# 获取购物车数据 (GET /api/cart/get)
@app.route('/api/cart/get', methods=['GET'])
def get_cart():
    try:
        conn = get_db_connection()
        cursor = conn.cursor(pymysql.cursors.DictCursor)

        cursor.execute("SELECT * FROM cart_items")
        cart_items = cursor.fetchall()

        cursor.close()
        conn.close()

        return jsonify({'code': 0, 'data': cart_items})
    except Exception as e:
        print("获取购物车数据失败:", e)
        return jsonify({'code': 500, 'message': '服务器内部错误'}), 500
    
# 删除购物车商品接口 (DELETE /api/cart/delete)
@app.route('/api/cart/delete', methods=['DELETE'])
def delete_cart_item():
    try:
        data = request.get_json()
        image_key = data.get('image_key')
        
        if not image_key:
            return jsonify({'code': 400, 'message': '商品图片标识不能为空'}), 400

        conn = get_db_connection()
        cursor = conn.cursor()

        cursor.execute("DELETE FROM cart_items WHERE image_key = %s", (image_key,))
        
        if cursor.rowcount == 0:
            cursor.close()
            conn.close()
            return jsonify({'code': 404, 'message': '商品不存在'}), 404

        conn.commit()
        cursor.close()
        conn.close()

        return jsonify({'code': 0, 'message': '商品删除成功'})
    except Exception as e:
        print("删除购物车商品失败:", e)
        return jsonify({'code': 500, 'message': '服务器内部错误'}), 500

# 清空购物车接口 (DELETE /api/cart/clear)
@app.route('/api/cart/clear', methods=['DELETE'])
def clear_cart():
    try:
        conn = get_db_connection()
        cursor = conn.cursor()

        cursor.execute("DELETE FROM cart_items")
        
        conn.commit()
        cursor.close()
        conn.close()

        return jsonify({'code': 0, 'message': '购物车清空成功'})
    except Exception as e:
        print("清空购物车失败:", e)
        return jsonify({'code': 500, 'message': '服务器内部错误'}), 500

# 更新商品数量接口 (PUT /api/cart/update_quantity)
@app.route('/api/cart/update_quantity', methods=['PUT'])
def update_quantity():
    try:
        data = request.get_json()
        image_key = data.get('image_key')
        quantity = int(data.get('quantity'))
        
        if not image_key:
            return jsonify({'code': 400, 'message': '商品图片标识不能为空'}), 400
        
        if quantity <= 0:
            return jsonify({'code': 400, 'message': '商品数量必须大于0'}), 400

        conn = get_db_connection()
        cursor = conn.cursor()

        cursor.execute("SELECT price FROM cart_items WHERE image_key = %s", (image_key,))
        result = cursor.fetchone()
        
        if not result:
            cursor.close()
            conn.close()
            return jsonify({'code': 404, 'message': '商品不存在'}), 404
        
        price = result[0]
        total_price = price * quantity
        
        cursor.execute(
            "UPDATE cart_items SET quantity = %s, total_price = %s WHERE image_key = %s",
            (quantity, total_price, image_key)
        )

        conn.commit()
        cursor.close()
        conn.close()

        return jsonify({'code': 0, 'message': '商品数量更新成功'})
    except Exception as e:
        print("更新商品数量失败:", e)
        return jsonify({'code': 500, 'message': '服务器内部错误'}), 500

    # 添加收藏商品接口 (POST /api/collect/add)
@app.route('/api/collect/add', methods=['POST'])
def add_to_collect():
    try:
        data = request.get_json()  # 获取前端发送的 JSON 数据
        image_key = data.get('image_key')  # 获取商品图片的唯一标识
        product_name = data.get('product_name')  # 商品名称
        price = float(data.get('price'))  # 商品单价

        if not image_key:
            return jsonify({'code': 400, 'message': '商品图片标识不能为空'}), 400

        conn = get_db_connection()
        if not conn:
            return jsonify({'code': 500, 'message': '数据库连接失败'}), 500

        cursor = conn.cursor()

        # 检查收藏表中是否已经存在该商品
        cursor.execute("SELECT * FROM collect_items WHERE image_key = %s", (image_key,))
        existing_item = cursor.fetchone()

        if existing_item:
            # 如果商品已存在，返回提示信息
            return jsonify({'code': 0, 'message': '该商品已添加到收藏'})  # 返回成功状态码，但提示商品已存在
        else:
            # 如果商品不存在，插入新记录
            cursor.execute(
                "INSERT INTO collect_items (image_key, product_name, price, quantity) VALUES (%s, %s, %s, %s)",
                (image_key, product_name, price, 1)
            )

        conn.commit()  # 提交事务
        cursor.close()
        conn.close()

        return jsonify({'code': 0, 'message': '收藏成功'})
    except Exception as e:
        print("添加到收藏失败:", e)
        return jsonify({'code': 500, 'message': '服务器内部错误'}), 500
    
        # 获取收藏商品接口 (GET /api/collect/get)
@app.route('/api/collect/get', methods=['GET'])
def get_collect():
    try:
        conn = get_db_connection()
        if not conn:
            return jsonify({'code': 500, 'message': '数据库连接失败'}), 500

        cursor = conn.cursor(pymysql.cursors.DictCursor)  # 使用字典游标，方便返回 JSON 数据

        # 查询收藏表中的所有商品
        cursor.execute("SELECT * FROM collect_items")
        collect_items = cursor.fetchall()

        cursor.close()
        conn.close()

        return jsonify({'code': 0, 'data': collect_items})
    except Exception as e:
        print("获取收藏商品失败:", e)
        return jsonify({'code': 500, 'message': '服务器内部错误'}), 500
    
    # 删除收藏商品接口 (DELETE /api/collect/delete)
@app.route('/api/collect/delete', methods=['DELETE'])
def delete_collect_item():
    try:
        data = request.get_json()
        image_key = data.get('image_key')
        
        if not image_key:
            return jsonify({'code': 400, 'message': '商品图片标识不能为空'}), 400

        conn = get_db_connection()
        if not conn:
            return jsonify({'code': 500, 'message': '数据库连接失败'}), 500

        cursor = conn.cursor()

        # 删除指定商品
        cursor.execute("DELETE FROM collect_items WHERE image_key = %s", (image_key,))
        
        if cursor.rowcount == 0:
            cursor.close()
            conn.close()
            return jsonify({'code': 404, 'message': '商品不存在'}), 404

        conn.commit()
        cursor.close()
        conn.close()

        return jsonify({'code': 0, 'message': '商品删除成功'})
    except Exception as e:
        print("删除收藏商品失败:", e)
        return jsonify({'code': 500, 'message': '服务器内部错误'}), 500



# 获取用户信息接口 (GET /api/user/<user_id>)
@app.route('/api/user/<int:user_id>', methods=['GET'])
def get_user_info(user_id):
    try:
        conn = get_db_connection()
        cursor = conn.cursor()
        
        try:
            cursor.execute("SELECT id, username, password, phone, create_time FROM users WHERE id = %s", (user_id,))
            user = cursor.fetchone()
        except pymysql.Error as e:
            print(f"数据库查询出错: {str(e)}")
            return jsonify({'code': 500, 'message': '数据库错误'}), 500

        if not user:
            cursor.close()
            conn.close()
            return jsonify({'code': 404, 'message': '用户不存在'}), 404

        user_data = {
            'id': user[0],
            'username': user[1],
            'password': user[2],
            'phone': user[3] if user[3] else '',
            'create_time': user[4].strftime('%Y-%m-%d %H:%M:%S') if user[4] else ''
        }

        cursor.close()
        conn.close()
        return jsonify({'code': 0, 'message': '获取成功', 'data': user_data})
    except Exception as e:
        print(f"获取用户信息失败: {str(e)}")
        return jsonify({'code': 500, 'message': '服务器内部错误'}), 500

# 更新用户手机号接口 (PUT /api/user/<user_id>/phone)
@app.route('/api/user/<int:user_id>/phone', methods=['PUT'])
def update_user_phone(user_id):
    try:
        raw_data = request.data.decode('utf-8')
        if not raw_data or raw_data.strip() == '':
            return jsonify({'code': 400, 'message': '请求体为空'}), 400
            
        try:
            data = json.loads(raw_data)
        except json.JSONDecodeError as e:
            return jsonify({'code': 400, 'message': f'请求格式错误: {str(e)}'}), 400
        
        phone = data.get('phone')
        if not phone:
            return jsonify({'code': 400, 'message': '手机号不能为空'}), 400

        # 验证手机号格式（11位数字）
        if not phone.isdigit() or len(phone) != 11:
            return jsonify({'code': 400, 'message': '请输入正确的11位手机号'}), 400

        conn = get_db_connection()
        cursor = conn.cursor()
        
        try:
            # 检查用户是否存在
            cursor.execute("SELECT id FROM users WHERE id = %s", (user_id,))
            user = cursor.fetchone()
            
            if not user:
                cursor.close()
                conn.close()
                return jsonify({'code': 404, 'message': '用户不存在'}), 404

            # 检查手机号是否已被其他用户使用
            cursor.execute("SELECT id FROM users WHERE phone = %s AND id != %s", (phone, user_id))
            existing_user = cursor.fetchone()
            
            if existing_user:
                cursor.close()
                conn.close()
                return jsonify({'code': 409, 'message': '该手机号已被其他用户使用'}), 409

            # 更新手机号
            cursor.execute("UPDATE users SET phone = %s WHERE id = %s", (phone, user_id))
            conn.commit()

            cursor.close()
            conn.close()
            return jsonify({'code': 0, 'message': '手机号更新成功'})
        except pymysql.Error as e:
            conn.rollback()
            cursor.close()
            conn.close()
            print(f"数据库更新出错: {str(e)}")
            return jsonify({'code': 500, 'message': '数据库错误'}), 500
    except Exception as e:
        print(f"更新手机号失败: {str(e)}")
        return jsonify({'code': 500, 'message': '服务器内部错误'}), 500


# 健康检查接口
@app.route('/api/health', methods=['GET'])
def health_check():
    return jsonify({'status': 'ok', 'message': '服务器运行正常'}), 200

# 启动后端服务
if __name__ == '__main__':
    print("=== 垃圾回收APP后端服务器 ===")
    print("服务器地址: http://192.168.xxx.xxx:8080")
    print("按 Ctrl+C 停止服务器")
    print("=" * 40)
    
    try:
        conn = get_db_connection()
        print("✓ 数据库连接成功")
        conn.close()
    except Exception as e:
        print(f"✗ 数据库连接失败: {e}")
        print("请检查MySQL服务是否启动，以及连接参数是否正确")
        exit(1)
    
    app.run(host='0.0.0.0', port=8080, debug=True)
