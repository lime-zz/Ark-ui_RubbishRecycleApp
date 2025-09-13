interface SystemDataType {
  id: number,
  name: string,
  created_at: string
}

interface ServerResponseDataType {
  code: number,
  message: string,
  data: SystemDataType[]  // 注意是数组
}

export default ServerResponseDataType;