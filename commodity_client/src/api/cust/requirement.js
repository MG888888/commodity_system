import request from '@/utils/request'
// export const getAllList = (page, limit) => request({ url: '/project/list/${page}/${limit}', method: 'get' })
export default {
  getAllList: (params) => {
    return request({
      url: '/customer/requirement/list',
      method: 'get',
      params
    })
  },
  save: (data) => {
    return request({
      url: '/customer/requirement/save',
      method: 'post',
      data
    })
  },
  delete: (id) => {
    return request({
      url: '/customer/requirement/remove/' + id,
      method: 'delete'
    })
  },
  selectByName: (name) => {
    return request({
      url: '/customer/requirement/select',
      method: 'get',
      params: name
    })
  }
}
