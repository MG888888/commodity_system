import request from '@/utils/request'
// export const getAllList = (page, limit) => request({ url: '/project/list/${page}/${limit}', method: 'get' })
export default {
  getAllList: (params) => {
    return request({
      url: '/stuff/group/list',
      method: 'get',
      params
    })
  },
  save: (data) => {
    return request({
      url: '/stuff/group/save',
      method: 'post',
      data
    })
  },
  delete: (id) => {
    return request({
      url: '/stuff/group/remove/' + id,
      method: 'delete'
    })
  },
  selectByName: (name) => {
    return request({
      url: '/stuff/group/select',
      method: 'get',
      params: name
    })
  }
}
