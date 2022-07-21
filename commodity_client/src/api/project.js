import request from '@/utils/request'
// export const getAllList = (page, limit) => request({ url: '/project/list/${page}/${limit}', method: 'get' })
export default {
  getAllList: (params) => {
    return request({
      url: '/project/list',
      method: 'get',
      params
    })
  },
  save: (data) => {
    return request({
      url: '/project/save',
      method: 'post',
      data
    })
  },
  delete: (id) => {
    return request({
      url: '/project/remove/' + id,
      method: 'delete'
    })
  },
  selectByName: (name) => {
    return request({
      url: '/project/select',
      method: 'get',
      params: name
    })
  },
  countFinish: () => {
    return request({
      url: '/project/count',
      method: 'get'
    })
  },
  countProject: (date) => {
    return request({
      url: '/project/select/project',
      method: 'get',
      params: date
    })
  }
}
