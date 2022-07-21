import request from '@/utils/request'
// export const getAllList = (page, limit) => request({ url: '/project/list/${page}/${limit}', method: 'get' })
export default {
  getAllList: (params) => {
    return request({
      url: '/assement/list',
      method: 'get',
      params
    })
  },
  save: (data) => {
    return request({
      url: '/assement/save',
      method: 'post',
      data
    })
  },
  delete: (id) => {
    return request({
      url: '/assement/remove/' + id,
      method: 'delete'
    })
  },
  selectByName: (name) => {
    return request({
      url: '/assement/select',
      method: 'get',
      params: name
    })
  }
}
