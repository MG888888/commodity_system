import request from '@/utils/request'
// export const getAllList = (page, limit) => request({ url: '/project/list/${page}/${limit}', method: 'get' })
export default {
  getAllList: (params) => {
    return request({
      url: '/cost/list',
      method: 'get',
      params
    })
  },
  save: (data) => {
    return request({
      url: '/cost/save',
      method: 'post',
      data
    })
  },
  delete: (id) => {
    return request({
      url: '/cost/remove/' + id,
      method: 'delete'
    })
  },
  selectByName: (name) => {
    return request({
      url: '/cost/select',
      method: 'get',
      params: name
    })
  }
}
