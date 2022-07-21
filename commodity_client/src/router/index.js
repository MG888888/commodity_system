import Vue from 'vue'
import Router from 'vue-router'
Vue.use(Router)
import Layout from '@/layout'
export const constantRoutes = [
  {
    path: '/login',
    component: () => import('@/views/login/index'),
    hidden: true
  },

  {
    path: '/404',
    component: () => import('@/views/404'),
    meta: { title: '404' },
    hidden: true
  },

  {
    path: '/',
    component: Layout,
    redirect: '/project/project'
  },
  {
    path: '/project',
    component: Layout,
    children: [{
      path: 'project',
      name: 'Project',
      component: () => import('@/views/project/index'),
      meta: { title: '商品管理', icon: 'dashboard' }
    }]
  },

  {
    path: '/cust',
    component: Layout,
    name: 'Cust',
    meta: { title: '客户管理', icon: 'el-icon-s-help' },
    children: [{
      path: 'information',
      name: 'information',
      component: () => import('@/views/cust/information'),
      meta: { title: '客户信息' }
    }
    ]
  },
  {
    path: '/cost',
    component: Layout,
    name: 'Cost',
    meta: { title: '成本管理', icon: 'el-icon-s-help' },
    children: [{
      path: 'cost',
      name: 'cost',
      component: () => import('@/views/cost/cost'),
      meta: { title: '成本管理' }
    }
    ]
  },
  // 404 page must be placed at the end !!!
  { path: '*', redirect: '/404', hidden: true }
]

const createRouter = () => new Router({
  // mode: 'history', // require service support
  scrollBehavior: () => ({ y: 0 }),
  routes: constantRoutes
})

const router = createRouter()

// Detail see: https://github.com/vuejs/vue-router/issues/1234#issuecomment-357941465
export function resetRouter() {
  const newRouter = createRouter()
  router.matcher = newRouter.matcher // reset router
}

export default router
