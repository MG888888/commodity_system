import request from '@/utils/request'
// export const getAllList = (page, limit) => request({ url: '/project/list/${page}/${limit}', method: 'get' })
export default {
  getAllList: (params) => {
    return request({
      url: '/progress/list',
      method: 'get',
      params
    })
  },
  save: (data) => {
    return request({
      url: '/progress/save',
      method: 'post',
      data
    })
  },
  delete: (id) => {
    return request({
      url: '/progress/remove/' + id,
      method: 'delete'
    })
  },
  selectByName: (name) => {
    return request({
      url: '/progress/select',
      method: 'get',
      params: name
    })
  }
}
