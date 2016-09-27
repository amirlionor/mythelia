<?php
/*************************************************************************************/
/*      This file is part of the Thelia package.                                     */
/*                                                                                   */
/*      Copyright (c) OpenStudio                                                     */
/*      email : dev@thelia.net                                                       */
/*      web : http://www.thelia.net                                                  */
/*                                                                                   */
/*      For the full copyright and license information, please view the LICENSE.txt  */
/*      file that was distributed with this source code.                             */
/*************************************************************************************/

namespace Mythelia;


use Thelia\Module\BaseModule;
use Propel\Runtime\Connection\ConnectionInterface;
use Thelia\Install\Database;
use Thelia\Core\Template\TemplateDefinition;

class Mythelia extends BaseModule
{
    /** @var string */
    const DOMAIN_NAME = 'mythelia';
    /** @cont string */
    const MESSAGE_DOMAIN = 'mythelia';
    
    public function postActivation(ConnectionInterface $con = null) {
        if (!$this->getConfigValue('is_initialized', false)) {
            $database = new Database($con);
           // $database->insertSql(null, array(__DIR__ . '/Config/create.sql'));
            $database->insertSql(null, array(__DIR__ . '/Config/create.sql'));
            $this->setConfigValue('is_initialized', true);
        }
        return true;
    }
    
    public function postDeactivation(ConnectionInterface $con = null) {
         $database = new Database($con);
         $database->insertSql(null, array(__DIR__ . '/Config/destroy.sql'));
        $this->setConfigValue('is_initialized', false);
    }

    public function destroy(ConnectionInterface $con = null, $deleteModuleData = false) {
        $database = new Database($con);
        if ($deleteModuleData) {
            $database->insertSql(null, array(__DIR__ . '/Config/destroy.sql'));
        }
    }
}
