import request from '@/utils/request'
// export const getAllList = (page, limit) => request({ url: '/project/list/${page}/${limit}', method: 'get' })
export default {
  getAllList: (params) => {
    return request({
      url: '/stuff/information/list',
      method: 'get',
      params
    })
  },
  save: (data) => {
    return request({
      url: '/stuff/information/save',
      method: 'post',
      data
    })
  },
  delete: (id) => {
    return request({
      url: '/stuff/information/remove/' + id,
      method: 'delete'
    })
  },
  selectByName: (name) => {
    return request({
      url: '/stuff/information/select',
      method: 'get',
      params: name
    })
  }
}
