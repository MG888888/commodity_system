import request from '@/utils/request'
// export const getAllList = (page, limit) => request({ url: '/project/list/${page}/${limit}', method: 'get' })
export default {
  getAllList: (params) => {
    return request({
      url: '/customer/infomation/list',
      method: 'get',
      params
    })
  },
  save: (data) => {
    return request({
      url: '/customer/infomation/save',
      method: 'post',
      data
    })
  },
  delete: (id) => {
    return request({
      url: '/customer/infomation/remove/' + id,
      method: 'delete'
    })
  },
  selectByName: (name) => {
    return request({
      url: '/customer/infomation/select',
      method: 'get',
      params: name
    })
  }
}
